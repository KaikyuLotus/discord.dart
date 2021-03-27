library entities;

class WebhookUpdateEvent {
  final String guildId;
  final String channelId;

  WebhookUpdateEvent({
    required this.guildId,
    required this.channelId,
  });

  static WebhookUpdateEvent fromJson(Map<String, dynamic> json) {
    return WebhookUpdateEvent(
      guildId: json['guild_id'],
      channelId: json['channel_id'],
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'channel_id': channelId,
    };
  }
}
