import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:discord/discord.dart';
import 'package:discord/entities/ops/heartbeat.dart';
import 'package:discord/entities/ops/rpcable.dart';

class DiscordClient {
  static final int _apiVersion = 8;

  late final Map<int, Function(dynamic)> handlers;

  late final Map<String, Function(dynamic)> gatewayHandlers;

  late final WebSocket _ws;

  final String token;

  final List<Intent> intents;

  DiscordClient._(
    this.token,
    WebSocket ws, {
    required this.intents,
  }) {
    handlers = {
      0: _onGatewayEvent,
      9: _onInvalidSession,
      10: _onHello,
      11: (e) {},
    };
    gatewayHandlers = {
      'READY': _onReady,
      'GUILD_CREATE': _onGuildCreated,
    };
    _ws = ws;
    print('Listening WebSocket...');
    _ws.listen(_onWebSocketEvent).onError(_onWebSocketError);
    _ws.handleError((err) {
      print(err);
    });
  }

  // TODO handle oauth2 for users
  static Future<DiscordClient> fromToken(
    String token, {
    required List<Intent> intents,
  }) async {
    // TODO get dynamic websocket url
    final channel = await WebSocket.connect(
      'wss://gateway.discord.gg/?v=$_apiVersion&encoding=json',
    );
    return DiscordClient._(
      token,
      channel,
      intents: intents,
    );
  }

  Future _send(Rpcable data) async {
    _ws.add(json.encode(data.rpc()));
  }

  void _onWebSocketError(Object error, [StackTrace? stackTrace]) {
    print(error);
    print(stackTrace);
  }

  void _onWebSocketEvent(event) {
    try {
      var data = json.decode('$event');
      var opCode = data['op'] as int;

      if (handlers.containsKey(opCode)) {
        return handlers[opCode]!(data);
      }

      print('Unknown op code: $opCode');
    } catch (e, s) {
      print('Could not handle update: $e\n$s');
      print(event);
    }
  }

  void _onGatewayEvent(dynamic event) {
    var eventType = event['t'];
    if (gatewayHandlers.containsKey(eventType)) {
      return gatewayHandlers[eventType]!(event['d']);
    }
    print('Unknown gateway event: $eventType:\n$event');
  }

  // OP handlers

  void emptyHandler(dynamic event) {
    print('Empty handler called');
    print(json.encode(event));
  }

  void _identify() {
    _send(Identify(
      token: token,
      intents: intents,
      properties: ConnectionProperties(
        os: 'linux',
        browser: 'disco',
        device: 'disco',
      ),
      largeThreshold: 250,
      guildSubscriptions: false,
      shard: [0, 1],
    ));
  }

  void _onHello(dynamic event) {
    var heartbeatInterval = event['d']['heartbeat_interval'] as int;
    Timer.periodic(
      Duration(milliseconds: heartbeatInterval),
      (t) => _send(Heartbeat()),
    );
    _identify();
  }

  void _onInvalidSession(dynamic event) {
    print('Warning, invalid session'); // TODO crash?
  }

  // Gateway events

  // TODO correct type mapping
  void _onReady(dynamic event) {
    print(event);
  }

  // TODO correct type mapping
  void _onGuildCreated(dynamic event) {
    print(event);
  }
}
