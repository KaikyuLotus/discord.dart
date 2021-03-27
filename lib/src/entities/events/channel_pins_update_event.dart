library entities;

class ChannelPinsUpdateEvent {
  final String? guildId;
  final String channelId;
  final String? lastPinTimestamp;

  ChannelPinsUpdateEvent({
    this.guildId,
    required this.channelId,
    this.lastPinTimestamp,
  });

  static ChannelPinsUpdateEvent fromJson(Map<String, dynamic> json) {
    return ChannelPinsUpdateEvent(
      guildId: json['guild_id'],
      channelId: json['channel_id'],
      lastPinTimestamp: json['last_pin_timestamp'],
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'channel_id': channelId,
      'last_pin_timestamp': lastPinTimestamp,
    };
  }
}
