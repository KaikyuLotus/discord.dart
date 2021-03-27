library entities;

import '../../../entities.dart';

class GuildBanRemoveEvent {
  final String guildId;
  final User user;

  GuildBanRemoveEvent({
    required this.guildId,
    required this.user,
  });

  static GuildBanRemoveEvent fromJson(Map<String, dynamic> json) {
    return GuildBanRemoveEvent(
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
