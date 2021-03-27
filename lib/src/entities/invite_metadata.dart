library entities;

import '../../entities.dart';
import '../internal.dart';

class InviteMetadata extends Invite {
  final int uses;
  final int maxUses;
  final int maxAge;
  final bool temporary;
  final String createdAt;

  InviteMetadata({
    required this.uses,
    required this.maxUses,
    required this.maxAge,
    required this.temporary,
    required this.createdAt,
    required String code,
    Guild? guild,
    required Channel channel,
    User? inviter,
    User? targetUser,
    TargetUserType? targetUserType,
    int? approximatePresenceCount,
    int? approximateMemberCount,
  }) : super(
          code: code,
          guild: guild,
          channel: channel,
          inviter: inviter,
          targetUser: targetUser,
          targetUserType: targetUserType,
          approximatePresenceCount: approximatePresenceCount,
          approximateMemberCount: approximateMemberCount,
        );

  static InviteMetadata fromJson(Map<String, dynamic> json) {
    return InviteMetadata(
      uses: json['uses'],
      maxUses: json['max_uses'],
      maxAge: json['max_age'],
      temporary: json['temporary'],
      createdAt: json['created_at'],
      code: json['code'],
      guild: ifNotNull(Guild.fromJson, json['guild']),
      channel: Channel.fromJson(json['channel']!),
      inviter: ifNotNull(User.fromJson, json['inviter']),
      targetUser: ifNotNull(User.fromJson, json['target_user']),
      targetUserType: ifNotNull(
        TargetUserType.forValue,
        json['target_user_type'],
      ),
      approximatePresenceCount: json['approximate_presence_count'],
      approximateMemberCount: json['approximate_member_count'],
    );
  }

  @override
  Map toJson() {
    return {
      'uses': uses,
      'max_uses': maxUses,
      'max_age': maxAge,
      'temporary': temporary,
      'created_at': createdAt,
      'code': code,
      'guild': guild,
      'channel': channel,
      'inviter': inviter,
      'target_user': targetUser,
      'target_user_type': targetUserType,
      'approximate_presence_count': approximatePresenceCount,
      'approximate_member_count': approximateMemberCount,
    };
  }
}
