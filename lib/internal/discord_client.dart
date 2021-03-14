import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class DiscordClient {
  static final int _apiVersion = 8;

  late final Map<int, Function(dynamic)> handlers;

  late final WebSocket _ws;

  late final DiscordHTTPClient _http;

  final String _token;

  final List<Intent> intents;

  DiscordHTTPClient get http => _http;

  DiscordClient(
    this._token, {
    required this.intents,
  }) {
    _http = DiscordHTTPClient(_token);
    handlers = {
      0: _onGatewayEvent,
      9: _onInvalidSession,
      10: _onHello,
      11: (e) {},
    };
  }

  Future run() async {
    // TODO get dynamic websocket url
    _ws = await WebSocket.connect(
      'wss://gateway.discord.gg/?v=$_apiVersion&encoding=json',
    );
    print('Listening WebSocket...');
    _ws.listen(_onWebSocketEvent).onError(_onWebSocketError);
    _ws.handleError((err) {
      print(err);
    });
  }

  // TODO handle oauth2 for users
  static DiscordClient fromToken(
    String token, {
    required List<Intent> intents,
  }) {
    return DiscordClient(
      token,
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

  Future _onWebSocketEvent(event) async {
    try {
      var data = json.decode('$event');
      var opCode = data['op'] as int;

      if (handlers.containsKey(opCode)) {
        return await handlers[opCode]!(data);
      }

      print('Unknown op code: $opCode');
    } catch (e, s) {
      print('Could not handle update: $e\n$s');
      print(event);
    }
  }

  Future _onGatewayEvent(dynamic event) async {
    var eventType = event['t'];

    if (eventType == 'READY') {
      return await _onReady(event['d']);
    }

    if (eventType == 'MESSAGE_CREATE') {
      return await onMessageCreate(Message.fromJson(event['d']));
    }

    await _onEvent(eventType, event['d']);
  }

  void _identify() {
    _send(Identify(
      token: _token,
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

  // OP handlers
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
  Future _onReady(dynamic event) async {
    await onReady(event);
  }

  Future _onEvent(String type, dynamic event) async {
    await onEvent(type, event);
  }

  Future onReady(dynamic event) async {}

  Future onEvent(String type, dynamic event) async {}

  Future onMessageCreate(Message message) async {}

}
