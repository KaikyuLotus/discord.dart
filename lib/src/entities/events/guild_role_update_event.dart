library entities;

import '../../../entities.dart';

class GuildRoleUpdateEvent {
  final String guildId;
  final Role role;

  GuildRoleUpdateEvent({
    required this.guildId,
    required this.role,
  });

  static GuildRoleUpdateEvent fromJson(Map<String, dynamic> json) {
    return GuildRoleUpdateEvent(
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
