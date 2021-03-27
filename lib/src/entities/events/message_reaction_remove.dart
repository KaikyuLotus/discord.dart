library entities;

import '../../../entities.dart';

class MessageReactionRemoveEvent {
  final String userId;
  final String channelId;
  final String messageId;
  final String? guildId;
  final Emoji emoji;

  MessageReactionRemoveEvent({
    required this.userId,
    required this.channelId,
    required this.messageId,
    this.guildId,
    required this.emoji,
  });

  static MessageReactionRemoveEvent fromJson(Map<String, dynamic> json) {
    return MessageReactionRemoveEvent(
      userId: json['user_id'],
      channelId: json['channel_id'],
      messageId: json['message_id'],
      guildId: json['guild_id'],
      emoji: json['emoji'],
    );
  }

  Map toJson() {
    return {
      'user_id': userId,
      'channel_id': channelId,
      'message_id': messageId,
      'guild_id': guildId,
      'emoji': emoji,
    };
  }
}
