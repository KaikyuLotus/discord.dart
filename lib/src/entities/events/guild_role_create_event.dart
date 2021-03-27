library entities;

import '../../../entities.dart';

class GuildRoleCreateEvent {
  final String guildId;
  final Role role;

  GuildRoleCreateEvent({
    required this.guildId,
    required this.role,
  });

  static GuildRoleCreateEvent fromJson(Map<String, dynamic> json) {
    return GuildRoleCreateEvent(
      guildId: json['guild_id'],
      role: Role.fromJson(json['role']),
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'role': role,
    };
  }
}
