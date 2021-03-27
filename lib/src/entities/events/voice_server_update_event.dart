library entities;

class VoiceServerUpdateEvent {
  final String token;
  final String guildId;
  final String endpoint;

  VoiceServerUpdateEvent({
    required this.token,
    required this.guildId,
    required this.endpoint,
  });

  static VoiceServerUpdateEvent fromJson(Map<String, dynamic> json) {
    return VoiceServerUpdateEvent(
      token: json['token'],
      guildId: json['guild_id'],
      endpoint: json['endpoint'],
    );
  }

  Map toJson() {
    return {
      'token': token,
      'guild_id': guildId,
      'endpoint': endpoint,
    };
  }
}
