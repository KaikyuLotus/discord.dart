library entities;

class MessageDeleteBulkEvent {
  final List<String> id;
  final String channelId;
  final String guildId;

  MessageDeleteBulkEvent({
    required this.id,
    required this.channelId,
    required this.guildId,
  });

  static MessageDeleteBulkEvent fromJson(Map<String, dynamic> json) {
    return MessageDeleteBulkEvent(
      id: List<String>.from(json['id']),
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
