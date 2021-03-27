library discord;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../discord.dart';
import '../../entities.dart';
import '../internal.dart';

final clients = <DiscordClient?>[];

class DiscordClient extends DiscordEvents {
  static const int _apiVersion = 8;

  static const String encoding = 'json';

  late final application = ApplicationAPI(_http);

  late final interactions = InteractionsAPI(_http);

  late final guilds = GuildsAPI(_http);

  late final auditLog = AuditLogAPI(_http);

  late final channel = ChannelAPI(_http);

  late final emoji = EmojiAPI(_http);

  late final invite = InviteAPI(_http);

  late final template = TemplateAPI(_http);

  late final user = UserAPI(_http);

  late final voice = VoiceAPI(_http);

  late final webhook = WebhookAPI(_http);

  late final Map<int, Function(dynamic)> handlers = {
    0: (e) => _onGatewayEvent(OpDispatch.fromJson(e)),
    1: (e) => _onHeartbeatEvent(OpHeartbeat.fromJson(e)),
    7: (e) => _onReconnectEvent(OpReconnect.fromJson(e)),
    9: (e) => _onInvalidSession(OpInvalidSession.fromJson(e)),
    10: (e) => _onHello(OpHello.fromJson(e)),
    11: (e) {},
  };

  late final WebSocket _ws;

  late final String appId;

  late final int clientIndex;

  final ConnectionProperties _connectionProperties;

  final int _largeThreshold;

  final List<int> _numShards;

  final bool _guildSubscriptions;

  final String _token;

  final List<Intent> _intents;

  final DiscordHTTPClient _http;

  int? _sequence;

  DiscordClient(
    this._token, {
    List<Intent>? intents,
    ConnectionProperties connectionProperties = const ConnectionProperties(),
    int largeThreshold = 250,
    List<int> numShards = const [0, 1],
    bool guildSubscriptions = false,
  })  : _http = DiscordHTTPClient(_token),
        _intents = intents ?? Intent.all,
        _largeThreshold = largeThreshold,
        _numShards = numShards,
        _connectionProperties = connectionProperties,
        _guildSubscriptions = guildSubscriptions {
    clientIndex = clients.length;
    clients.add(this);
  }

  Future run() async {
    // TODO get dynamic Websocket url
    _ws = await WebSocket.connect(
      'wss://gateway.discord.gg/?v=$_apiVersion&encoding=$encoding',
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

  void _onWebSocketEvent(event) {
    runZonedGuarded(() async {
      var data = json.decode('$event');
      var opCode = data['op'] as int;

      if (handlers.containsKey(opCode)) {
        return await handlers[opCode]!(data);
      }

      print('Unknown op code: $opCode');
    }, (e, s) {
      print('Could not handle update: $e\n$s');
      print(event);
    });
  }

  Future _onGatewayEvent(OpDispatch event) async {
    _sequence = event.sequence;

    if (event.type == 'READY') {
      await _onReady(Ready.fromJson(event.data));
    }

    await _onEvent(event.type, event.data);
    await onEvent?.call(this, event.data, event);

    await eventHandlers[event.type]?.call(this, event.data);

    print(json.encode(event));
  }

  void _identify() {
    _send(OpIdentify(
      token: _token,
      intents: _intents,
      properties: _connectionProperties,
      largeThreshold: _largeThreshold,
      guildSubscriptions: _guildSubscriptions,
      shard: _numShards,
    ));
  }

  void _onHeartbeatEvent(OpHeartbeat heartbeat) {
    // empty impl
  }

  void _onReconnectEvent(OpReconnect reconnect) {
    // empty impl
  }

  // OP handlers
  void _onHello(OpHello hello) {
    Timer.periodic(
      Duration(milliseconds: hello.heartbeatInterval),
      (t) => _send(OpHeartbeat(_sequence)),
    );
    _identify();
  }

  void _onInvalidSession(OpInvalidSession invalidSession) {
    print('Warning, invalid session'); // TODO crash?
  }

  // Gateway events

  Future _onReady(Ready event) async {
    appId = event.application.id;
  }

  Future _onEvent(String type, dynamic event) async {
    // Empty impl
  }

  /// Call this method if you're not going to use this client anymore
  void close() {
    clients[clientIndex] = null;
    _http.close();
  }
}
