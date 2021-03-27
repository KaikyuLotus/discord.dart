library entities;

import '../../entities.dart';
import '../internal.dart';

class Channel {
  final String id;
  final ChannelType type;
  final String? guildId;
  final int? position;
  final List<Overwrite>? permissionOverwrites;
  final String? name;
  final String? topic;
  final bool? nsfw;
  final String? lastMessageId;
  final int? bitrate;
  final int? userLimit;
  final int? rateLimitPerUser;
  final List<User>? recipients;
  final String? icon;
  final String? ownerId;
  final String? applicationId;
  final String? parentId;
  final String? lastPinTimestamp;

  Channel({
    required this.id,
    required this.type,
    this.guildId,
    this.position,
    this.permissionOverwrites,
    this.name,
    this.topic,
    this.nsfw,
    this.lastMessageId,
    this.bitrate,
    this.userLimit,
    this.rateLimitPerUser,
    this.recipients,
    this.icon,
    this.ownerId,
    this.applicationId,
    this.parentId,
    this.lastPinTimestamp,
  });

  static Channel fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      type: ChannelType.forValue(json['type']),
      guildId: json['guild_id'],
      position: json['position'],
      permissionOverwrites: fromArray(
        Overwrite.fromJson,
        json['permission_overwrites'],
      ),
      name: json['name'],
      topic: json['topic'],
      nsfw: json['nsfw'],
      lastMessageId: json['last_message_id'],
      bitrate: json['bitrate'],
      userLimit: json['user_limit'],
      rateLimitPerUser: json['rate_limit_per_user'],
      recipients: fromArray(User.fromJson, json['recipients']),
      icon: json['icon'],
      ownerId: json['owner_id'],
      applicationId: json['application_id'],
      parentId: json['parent_id'],
      lastPinTimestamp: json['last_pin_timestamp'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'type': type,
      'guild_id': guildId,
      'position': position,
      'permission_overwrites': permissionOverwrites,
      'name': name,
      'topic': topic,
      'nsfw': nsfw,
      'last_message_id': lastMessageId,
      'bitrate': bitrate,
      'user_limit': userLimit,
      'rate_limit_per_user': rateLimitPerUser,
      'recipients': recipients,
      'icon': icon,
      'owner_id': ownerId,
      'application_id': applicationId,
      'parent_id': parentId,
      'last_pin_timestamp': lastPinTimestamp,
    };
  }
}
