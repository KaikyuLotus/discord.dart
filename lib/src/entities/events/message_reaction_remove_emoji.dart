library entities;

import '../../../entities.dart';

class MessageReactionRemoveEmojiEvent {
  final String channelId;
  final String? guildId;
  final String messageId;
  final Emoji emoji;

  MessageReactionRemoveEmojiEvent({
    required this.channelId,
    required this.messageId,
    this.guildId,
    required this.emoji,
  });

  static MessageReactionRemoveEmojiEvent fromJson(Map<String, dynamic> json) {
    return MessageReactionRemoveEmojiEvent(
      channelId: json['channel_id'],
      messageId: json['message_id'],
      guildId: json['guild_id'],
      emoji: Emoji.fromJson(json['emoji']),
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'message_id': messageId,
      'guild_id': guildId,
      'emoji': emoji,
    };
  }
}
