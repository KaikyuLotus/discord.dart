import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Connection {
  final String id;
  final String name;
  final String type;
  final bool? revoked;
  final List<Integration>? integrations;
  final bool verified;
  final bool friendSync;
  final bool showActivity;
  final int visibility;

  Connection({
    required this.id,
    required this.name,
    required this.type,
    this.revoked,
    this.integrations,
    required this.verified,
    required this.friendSync,
    required this.showActivity,
    required this.visibility,
  });

  static Connection fromJson(Map<String, dynamic> json) {
    return Connection(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      revoked: json['revoked'],
      integrations: fromArray(Integration.fromJson, json['integrations']),
      verified: json['verified'],
      friendSync: json['friend_sync'],
      showActivity: json['show_activity'],
      visibility: json['visibility'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'revoked': revoked,
      'integrations': integrations,
      'verified': verified,
      'friend_sync': friendSync,
      'show_activity': showActivity,
      'visibility': visibility,
    };
  }
}
