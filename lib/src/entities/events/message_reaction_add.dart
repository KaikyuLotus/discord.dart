library entities;

import '../../../entities.dart';
import '../../internal.dart';

class MessageReactionAddEvent {
  final String userId;
  final String channelId;
  final String messageId;
  final String? guildId;
  final Member? member;
  final Emoji emoji;

  MessageReactionAddEvent({
    required this.userId,
    required this.channelId,
    required this.messageId,
    this.guildId,
    this.member,
    required this.emoji,
  });

  static MessageReactionAddEvent fromJson(Map<String, dynamic> json) {
    return MessageReactionAddEvent(
      userId: json['user_id'],
      channelId: json['channel_id'],
      messageId: json['message_id'],
      guildId: json['guild_id'],
      member: ifNotNull(Member.fromJson, json['member']),
      emoji: Emoji.fromJson(json['emoji']),
    );
  }

  Map toJson() {
    return {
      'user_id': userId,
      'channel_id': channelId,
      'message_id': messageId,
      'guild_id': guildId,
      'member': member,
      'emoji': emoji,
    };
  }
}
