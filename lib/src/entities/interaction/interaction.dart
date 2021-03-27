library entities;

import '../../../entities.dart';
import '../../internal.dart';

class Interaction {

  // DiscordClient _client = DiscordClient("");

  final String id;

  final InteractionType type;

  /// Always present in type 2
  final ApplicationCommandInteractionData? data;
  final String? guildId;
  final String? channelId;
  final GuildMember? member;
  final User? user;
  final String token;
  final int version;

  Interaction({
    required this.id,
    required this.type,
    this.data,
    this.guildId,
    this.channelId,
    this.member,
    this.user,
    required this.token,
    required this.version,
  });

  static Interaction fromJson(Map<String, dynamic> json) {
    return Interaction(
      id: json['id'],
      type: InteractionType.forValue(json['type']),
      data: ifNotNull(ApplicationCommandInteractionData.fromJson, json['data']),
      guildId: json['guild_id'],
      channelId: json['channel_id'],
      member: ifNotNull(GuildMember.fromJson, json['member']),
      user: ifNotNull(User.fromJson, json['user']),
      token: json['token'],
      version: json['version'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'type': type,
      'data': data,
      'guild_id': guildId,
      'channel_id': channelId,
      'member': member,
      'user': user,
      'token': token,
      'version': version,
    };
  }
}
