library entities;

import '../../entities.dart';

class Webhook {
  final String id;

  // TODO enum https://discord.com/developers/docs/resources/webhook#webhook-object-webhook-types
  final int type;
  final String? guildId;
  final String channelId;
  final User? user;
  final String? name;
  final String? avatar;
  final String? applicationId;

  Webhook({
    required this.id,
    required this.type,
    this.guildId,
    required this.channelId,
    this.user,
    this.name,
    this.avatar,
    this.applicationId,
  });

  static Webhook fromJson(Map<String, dynamic> json) {
    return Webhook(
      id: json['id'],
      type: json['type'],
      guildId: json['guild_id'],
      channelId: json['channel_id'],
      user: User.fromJson(json['user']),
      name: json['name'],
      avatar: json['avatar'],
      applicationId: json['application_id'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'type': type,
      'guild_id': guildId,
      'channel_id': channelId,
      'user': user,
      'name': name,
      'avatar': avatar,
      'application_id': applicationId,
    };
  }
}
