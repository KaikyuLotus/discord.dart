library entities;

class GuildIntegrationsUpdateEvent {
  final String guildId;

  GuildIntegrationsUpdateEvent({required this.guildId});

  static GuildIntegrationsUpdateEvent fromJson(Map<String, dynamic> json) {
    return GuildIntegrationsUpdateEvent(guildId: json['guild_id']);
  }

  Map toJson() => {'guild_id': guildId};
}
