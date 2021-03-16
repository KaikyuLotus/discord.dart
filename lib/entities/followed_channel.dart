class FollowedChannel {
  final String channelId;
  final String webhookId;

  FollowedChannel({
    required this.channelId,
    required this.webhookId,
  });

  static FollowedChannel fromJson(Map<String, dynamic> json) {
    return FollowedChannel(
      channelId: json['channel_id'],
      webhookId: json['webhook_id'],
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'webhook_id': channelId,
    };
  }
}
