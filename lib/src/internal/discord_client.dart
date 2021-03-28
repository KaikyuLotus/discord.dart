library discord;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';

import '../../discord.dart';
import '../../entities.dart';
import '../internal.dart';

final clients = <DiscordClient?>[];

class DiscordClient extends DiscordEvents {
  static final log = Logger('discord.dart');

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

  late final _gateway = GatewayAPI(_http);

  late final Map<int, Function(dynamic)> handlers = {
    0: (e) => _onGatewayEvent(OpDispatch.fromJson(e)),
    1: (e) => _onHeartbeatEvent(OpHeartbeat.fromJson(e)),
    7: (e) => _onReconnectEvent(OpReconnect.fromJson(e)),
    9: (e) => _onInvalidSession(OpInvalidSession.fromJson(e)),
    10: (e) => _onHello(OpHello.fromJson(e)),
    11: (e) {},
  };

  var _wsOpen = false;
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

  Future<BotGateway> run() async {
    // TODO add support for users
    var botGateway = await _gateway.getGatewayBot();
    log.fine('Creating and opening websocket...');
    _ws = await WebSocket.connect(
      '${botGateway.url}?v=$_apiVersion&encoding=$encoding',
    );
    _wsOpen = true;
    log.fine('Listening WebSocket...');
    _ws.listen(_onWebSocketEvent).onError(_onWebSocketError);
    _ws.handleError(_onWebSocketError);
    return botGateway;
  }

  void _send(Rpcable data) {
    log.finest('Sending data to websocket');
    _ws.add(json.encode(data.rpc()));
  }

  void _onWebSocketError(Object e, [StackTrace? s]) {
    log.severe('Websocket error', e, s);
  }

  void _onError(Object e, [StackTrace? s]) {
    log.severe('Something went wrong', e, s);
  }

  void _onWebSocketEvent(event) {
    runZonedGuarded(() async {
      log.finest('New websocket event');
      var data = json.decode('$event');
      var opCode = data['op'] as int;
      log.finest('Websocket event is OP code $opCode');

      if (handlers.containsKey(opCode)) {
        return await handlers[opCode]!(data);
      }

      log.warning('No handler for OP code $opCode');
    }, _onError);
  }

  Future _onGatewayEvent(OpDispatch event) async {
    _sequence = event.sequence;
    log.finest('New event with sequence #$_sequence and type ${event.type}');

    if (event.type == 'READY') {
      await _onReady(Ready.fromJson(event.data));
    }

    log.finest('Calling generic event handler');
    await onEvent?.call(this, event.data, event);

    log.finest('Calling handler for type ${event.type}');
    await eventHandlers[event.type]?.call(this, event.data);
  }

  void _startHeartbeatTimer(int interval) {
    Timer.periodic(
      Duration(milliseconds: interval),
      (t) {
        if (!_wsOpen) return t.cancel();
        _send(OpHeartbeat(_sequence));
      },
    );
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
    _startHeartbeatTimer(hello.heartbeatInterval);
    _identify();
  }

  void _onInvalidSession(OpInvalidSession invalidSession) {
    // TODO crash?
    log.warning('Invalid session, resumable: ${invalidSession.resumable}');
  }

  // Gateway events

  Future _onReady(Ready event) async {
    appId = event.application.id;
    log.info('DiscordClient [AppID:$appId] is now ready');
  }

  /// Call this method if you're not going to use this client anymore
  void close() {
    clients[clientIndex] = null;
    _http.close();
    _ws.close();
  }
}
