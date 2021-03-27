library entities;

class MessageDeleteEvent {
  final String id;
  final String channelId;
  final String guildId;

  MessageDeleteEvent({
    required this.id,
    required this.channelId,
    required this.guildId,
  });

  static MessageDeleteEvent fromJson(Map<String, dynamic> json) {
    return MessageDeleteEvent(
      id: json['id'],
      channelId: json['channel_id'],
      guildId: json['guild_id'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'channel_id': channelId,
      'guild_id': guildId,
    };
  }
}
