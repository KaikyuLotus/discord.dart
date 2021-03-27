library entities;

class InviteDeleteEvent {
  final String channelId;
  final String? guildId;
  final String code;

  InviteDeleteEvent({
    required this.channelId,
    this.guildId,
    required this.code,
  });

  static InviteDeleteEvent fromJson(Map<String, dynamic> json) {
    return InviteDeleteEvent(
      channelId: json['channel_id'],
      guildId: json['guild_id'],
      code: json['code'],
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'guild_id': guildId,
      'code': code,
    };
  }
}
