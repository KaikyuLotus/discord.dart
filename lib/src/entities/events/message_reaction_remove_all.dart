library entities;

class MessageReactionRemoveAllEvent {
  final String channelId;
  final String messageId;
  final String? guildId;

  MessageReactionRemoveAllEvent({
    required this.channelId,
    required this.messageId,
    this.guildId,
  });

  static MessageReactionRemoveAllEvent fromJson(Map<String, dynamic> json) {
    return MessageReactionRemoveAllEvent(
      channelId: json['channel_id'],
      messageId: json['message_id'],
      guildId: json['guild_id'],
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'message_id': messageId,
      'guild_id': guildId,
    };
  }
}
