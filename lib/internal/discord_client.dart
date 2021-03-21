import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class DiscordClient {
  static final int _apiVersion = 8;

  late final guilds = GuildsAPI(http);

  late final auditLog = AuditLogAPI(http);

  late final channel = ChannelAPI(http);

  late final emoji = EmojiAPI(http);

  late final invite = InviteAPI(http);

  late final template = TemplateAPI(http);

  late final user = UserAPI(http);

  late final voice = VoiceAPI(http);

  late final webhook = WebhookAPI(http);

  late final Map<int, Function(dynamic)> handlers = {
    0: _onGatewayEvent,
    9: _onInvalidSession,
    10: _onHello,
    11: (e) {},
  };

  // Event handlers
  Future Function(DiscordClient client, dynamic event)? onReady;

  Future Function(DiscordClient client, Message event)? onMessageCreate;

  Future Function(DiscordClient client, String type, dynamic event)? onEvent;

  late final WebSocket _ws;

  late final DiscordHTTPClient http;

  final ConnectionProperties connectionProperties;

  final int largeThreshold;

  final List<int> numShards;

  final bool guildSubscriptions;

  final String _token;

  final List<Intent> intents;

  DiscordClient(
    this._token, {
    required this.intents,
    this.connectionProperties = const ConnectionProperties(
      os: 'Dart',
      browser: 'Unspecified',
      device: 'Unspecified',
    ),
    this.largeThreshold = 250,
    this.numShards = const [0, 1],
    this.guildSubscriptions = false,
  }) {
    http = DiscordHTTPClient(_token);
  }

  Future run() async {
    // TODO get dynamic websocket url
    _ws = await WebSocket.connect(
      'wss://gateway.discord.gg/?v=$_apiVersion&encoding=json',
    );
    print('Listening WebSocket...');
    _ws.listen(_onWebSocketEvent).onError(_onWebSocketError);
    _ws.handleError(print);
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
      return await onMessageCreate?.call(this, Message.fromJson(event['d']));
    }

    await _onEvent(eventType, event['d']);
  }

  void _identify() {
    _send(Identify(
      token: _token,
      intents: intents,
      properties: connectionProperties,
      largeThreshold: largeThreshold,
      guildSubscriptions: guildSubscriptions,
      shard: numShards,
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
    await onReady?.call(this, event);
  }

  Future _onEvent(String type, dynamic event) async {
    await onEvent?.call(this, type, event);
  }
}
