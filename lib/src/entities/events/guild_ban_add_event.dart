library entities;

import '../../../entities.dart';

class GuildBanAddEvent {
  final String guildId;
  final User user;

  GuildBanAddEvent({
    required this.guildId,
    required this.user,
  });

  static GuildBanAddEvent fromJson(Map<String, dynamic> json) {
    return GuildBanAddEvent(
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
