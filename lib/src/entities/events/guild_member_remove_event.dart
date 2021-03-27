library entities;

import '../../../entities.dart';

class GuildMemberRemoveEvent {
  final String guildId;
  final User user;

  GuildMemberRemoveEvent({
    required this.guildId,
    required this.user,
  });

  static GuildMemberRemoveEvent fromJson(Map<String, dynamic> json) {
    return GuildMemberRemoveEvent(
      guildId: json['guild_id'],
      user: User.fromJson(json['user']),
    );
  }

  Map toJson() {
    return {
      'user': user,
      'guild_id': guildId,
    };
  }
}
