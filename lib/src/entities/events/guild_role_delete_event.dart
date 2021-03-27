library entities;

class GuildRoleDeleteEvent {
  final String guildId;
  final String roleId;

  GuildRoleDeleteEvent({
    required this.guildId,
    required this.roleId,
  });

  static GuildRoleDeleteEvent fromJson(Map<String, dynamic> json) {
    return GuildRoleDeleteEvent(
      guildId: json['guild_id'],
      roleId: json['role_id'],
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'role_id': roleId,
    };
  }
}
