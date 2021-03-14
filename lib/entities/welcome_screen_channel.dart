class WelcomeScreenChannel {
  final String channelId;
  final String description;
  final String? emojiId;
  final String? emojiName;

  WelcomeScreenChannel({
    required this.channelId,
    required this.description,
    this.emojiId,
    this.emojiName,
  });

  static WelcomeScreenChannel fromJson(Map<String, dynamic> json) {
    return WelcomeScreenChannel(
      channelId: json['channelId'],
      description: json['description'],
      emojiId: json['emojiId'],
      emojiName: json['emojiName'],
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'description': description,
      'emoji_id': emojiId,
      'emoji_name': emojiName,
    };
  }
}
