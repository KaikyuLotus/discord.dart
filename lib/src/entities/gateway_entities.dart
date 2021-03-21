import '../../entities.dart';
import '../../src/internal.dart';

class Ready {
  /// Gateway version
  final int v;

  /// Information about the user including email
  final User user;

  /// The guilds the user is in
  final List<UnavailableGuild> guilds;

  /// Used for resuming connections
  final String sessionId;

  /// The shard information associated with this session,
  /// if sent when identifying
  final List<int>? shard;

  /// Contains id and flags
  final PartialApplication application;

  Ready({
    required this.v,
    required this.user,
    required this.guilds,
    required this.sessionId,
    this.shard,
    required this.application,
  });

  static Ready fromJson(Map<String, dynamic> json) {
    return Ready(
      v: json['v'],
      user: User.fromJson(json['user']),
      guilds: fromArray(UnavailableGuild.fromJson, json['guilds'])!,
      sessionId: json['session_id'],
      shard: json['shard'] != null ? List<int>.from(json['shard']) : null,
      application: PartialApplication.fromJson(json['application']),
    );
  }

  Map toJson() {
    return {
      'v': v,
      'user': user,
      'guilds': guilds,
      'session_id': sessionId,
      'shard': shard,
      'application': application,
    };
  }
}
