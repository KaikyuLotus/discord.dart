library entities;

import '../../entities.dart';
import '../internal.dart';

abstract class Rpcable {
  int get op;

  Map rpc() {
    return {
      'op': op,
      ...insertNotNull('d', this),
    };
  }
}

/// OP 0 - Receive
/// An event was dispatched.
class OpDispatch extends Rpcable {
  @override
  int get op => 0;

  final int sequence;

  final String type;

  final dynamic data;

  OpDispatch({
    required this.sequence,
    required this.type,
    required this.data,
  });

  static OpDispatch fromJson(dynamic json) {
    return OpDispatch(
      sequence: json['s'],
      type: json['t'],
      data: json['d'],
    );
  }

  Map toJson() {
    return {
      's': sequence,
      't': type,
      'd': data,
    };
  }
}

/// OP 1 - Send/Receive
/// Fired periodically by the client to keep the connection alive.
class OpHeartbeat extends Rpcable {
  @override
  int get op => 1;

  final int? sequenceNumber;

  OpHeartbeat(this.sequenceNumber);

  static OpHeartbeat fromJson(dynamic json) {
    return OpHeartbeat(json['d']);
  }

  int? toJson() => sequenceNumber;
}

/// OP 2 - Send
/// Starts a new session during the initial handshake.
class OpIdentify extends Rpcable {
  @override
  int get op => 2;

  final String token;
  final ConnectionProperties properties;
  final bool? compress;
  final int? largeThreshold;
  final List<int>? shard;
  final UpdateStatus? presence;
  final bool? guildSubscriptions;
  final List<Intent> intents;

  int get intentsShift => intents.isEmpty
      ? 0
      : intents.map((i) => 1 << i.value).reduce((a, b) => a + b);

  OpIdentify({
    required this.token,
    required this.properties,
    this.compress,
    this.largeThreshold,
    this.shard,
    this.presence,
    this.guildSubscriptions,
    required this.intents,
  });

  Map toJson() {
    return {
      'token': token,
      'properties': properties,
      'compress': compress,
      'large_threshold': largeThreshold,
      'shard': shard,
      'presence': presence,
      'guild_subscriptions': guildSubscriptions,
      'intents': intentsShift,
    };
  }
}

/// OP 3 - Send<br>
/// Update the client's presence.
class OpPresenceUpdate extends Rpcable {
  @override
  int get op => 3;

  final User user;
  final String guildId;
  final UserStatus status;
  final List<Activity> activities;
  final ClientStatus clientStatus;

  OpPresenceUpdate({
    required this.user,
    required this.guildId,
    required this.status,
    required this.activities,
    required this.clientStatus,
  });

  Map toJson() {
    return {
      'user': user,
      'guild_id': guildId,
      'status': status,
      'activities': activities,
      'client_status': clientStatus,
    };
  }
}

/// OP 4 - Send<br>
/// Used to join/leave or move between voice channels.
class OpVoiceStateUpdate extends Rpcable {
  @override
  int get op => 4;

  final String guildId;
  final String? channelId;
  final bool selfMute;
  final bool selfDeaf;

  OpVoiceStateUpdate({
    required this.guildId,
    this.channelId,
    required this.selfMute,
    required this.selfDeaf,
  });

  Map toJson() {
    return {
      'guild_id': guildId,
      'channel_id': channelId,
      'self_mute': selfMute,
      'self_deaf': selfDeaf,
    };
  }
}

/// OP 6 - Send<br>
/// Resume a previous session that was disconnected.
class OpResume extends Rpcable {
  @override
  int get op => 6;

  final String token;
  final String sessionId;
  final int seq;

  OpResume({
    required this.token,
    required this.sessionId,
    required this.seq,
  });

  Map toJson() {
    return {
      'token': token,
      'session_id': sessionId,
      'seq': seq,
    };
  }
}

/// OP 7 - Receive<br>
/// You should attempt to reconnect and resume immediately.
class OpReconnect extends Rpcable {
  @override
  int get op => 7;

  static OpReconnect fromJson(dynamic json) => OpReconnect();

  Null toJson() => null;
}

/// OP 8 - Send<br>
/// Request information about offline guild members in a large guild.
class OpRequestGuildMembers extends Rpcable {
  @override
  int get op => 8;

  final String guildId;
  final String? query;
  final int limit;
  final bool? presences;
  final List<String>? userIds;
  final String? nonce;

  OpRequestGuildMembers({
    required this.guildId,
    this.query,
    required this.limit,
    this.presences,
    this.userIds,
    this.nonce,
  });

  Map toJson() {
    return {
      'guildId': guildId,
      'query': query,
      'limit': limit,
      'presences': presences,
      'userIds': userIds,
      'nonce': nonce,
    };
  }
}

/// OP 9 - Receive<br>
/// The session has been invalidated.<br>
/// You should reconnect and identify/resume accordingly.
class OpInvalidSession extends Rpcable {
  @override
  int get op => 9;

  final bool resumable;

  OpInvalidSession({required this.resumable});

  static OpInvalidSession fromJson(dynamic json) {
    return OpInvalidSession(resumable: json['d']);
  }

  Map toJson() => rpc();
}

/// OP 10 - Receive<br>
/// Sent immediately after connecting, contains the [heartbeatInterval] to use.
class OpHello extends Rpcable {
  @override
  int get op => 10;

  final int heartbeatInterval;

  OpHello({required this.heartbeatInterval});

  static OpHello fromJson(dynamic json) {
    return OpHello(heartbeatInterval: json['d']['heartbeat_interval']);
  }

  Map toJson() => rpc();
}

/// OP 11 - Receive<br>
/// Sent in response to receiving a heartbeat
/// to acknowledge that it has been received.
class OpHeartbeatACK extends Rpcable {
  @override
  int get op => 11;

  Null toJson() => null;
}
