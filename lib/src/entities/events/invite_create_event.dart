library entities;

import '../../../entities.dart';
import '../../internal.dart';

class InviteCreateEvent {
  final String channelId;
  final String code;
  final String timestamp;
  final String? guildId;
  final User? inviter;
  final int maxAge;
  final int maxUses;
  final User? targetUser;
  final int? targetUserType;
  final bool temporary;
  final int uses;

  InviteCreateEvent({
    required this.channelId,
    required this.code,
    required this.timestamp,
    this.guildId,
    this.inviter,
    required this.maxAge,
    required this.maxUses,
    this.targetUser,
    this.targetUserType,
    required this.temporary,
    required this.uses,
  });

  static InviteCreateEvent fromJson(Map<String, dynamic> json) {
    return InviteCreateEvent(
      channelId: json['channel_id'],
      code: json['code'],
      timestamp: json['timestamp'],
      guildId: json['guild_id'],
      inviter: ifNotNull(User.fromJson, json['inviter']),
      maxAge: json['max_age'],
      maxUses: json['max_uses'],
      targetUser: ifNotNull(User.fromJson, json['target_user']),
      targetUserType: json['target_user_type'],
      temporary: json['temporary'],
      uses: json['uses'],
    );
  }

  Map toJson() {
    return {
      'channel_id': channelId,
      'code': code,
      'timestamp': timestamp,
      'guild_id': guildId,
      'inviter': inviter,
      'max_age': maxAge,
      'max_uses': maxUses,
      'target_user': targetUser,
      'target_user_type': targetUserType,
      'temporary': temporary,
      'uses': uses,
    };
  }
}
