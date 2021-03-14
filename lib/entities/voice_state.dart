import 'package:discord/discord.dart';

class VoiceState {
  final String? guildId;
  final String? channelId;
  final String userId;
  final Member member;
  final String sessionId;
  final bool deaf;
  final bool mute;
  final bool selfDeaf;
  final bool selfMute;
  final bool? selfStream;
  final bool selfVideo;
  final bool suppress;

  VoiceState({
    this.guildId,
    this.channelId,
    required this.userId,
    required this.member,
    required this.sessionId,
    required this.deaf,
    required this.mute,
    required this.selfDeaf,
    required this.selfMute,
    this.selfStream,
    required this.selfVideo,
    required this.suppress,
  });

  static VoiceState fromJson(Map<String, dynamic> json) {
    return VoiceState(
      guildId: json['guild_id'],
      channelId: json['channel_id'],
      userId: json['user_id'],
      member: Member.fromJson(json['member']),
      sessionId: json['session_id'],
      deaf: json['deaf'],
      mute: json['mute'],
      selfDeaf: json['self_deaf'],
      selfMute: json['self_mute'],
      selfStream: json['self_stream'],
      selfVideo: json['self_video'],
      suppress: json['suppress'],
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'channel_id': channelId,
      'user_id': userId,
      'member': member,
      'session_id': sessionId,
      'deaf': deaf,
      'mute': mute,
      'self_deaf': selfDeaf,
      'self_mute': selfMute,
      'self_stream': selfStream,
      'self_video': selfVideo,
      'suppress': suppress,
    };
  }
}
