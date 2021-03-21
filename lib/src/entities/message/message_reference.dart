library entities;

class MessageReference {
  final String? messageId;
  final String? channelId;
  final String guildId;
  final bool? failIfNotExists;

  MessageReference({
    this.messageId,
    this.channelId,
    required this.guildId,
    this.failIfNotExists,
  });

  static MessageReference fromJson(Map<String, dynamic> json) {
    return MessageReference(
      messageId: json['message_id'],
      channelId: json['channel_id'],
      guildId: json['guild_id'],
      failIfNotExists: json['fail_if_not_exists'],
    );
  }

  Map toJson() {
    return {
      'message_id': messageId,
      'channel_id': channelId,
      'guild_id': guildId,
      'fail_if_not_exists': failIfNotExists,
    };
  }
}
