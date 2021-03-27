library entities;

import '../../../entities.dart';
import '../../internal.dart';

class TypingStartEvent {
  final String channelId;
  final String? guildId;
  final String userId;
  final int timestamp;
  final Member? member;

  TypingStartEvent({
    required this.channelId,
    this.guildId,
    required this.userId,
    required this.timestamp,
    this.member,
  });

  static TypingStartEvent fromJson(Map<String, dynamic> json) {
    return TypingStartEvent(
      channelId: json['channel_id'],
      guildId: json['guild_id'],
      userId: json['user_id'],
      timestamp: json['timestamp'],
      member: ifNotNull(Member.fromJson, json['member']),
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'guild_id': guildId,
      'user_id': userId,
      'timestamp': timestamp,
      'member': member,
    };
  }
}
