import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Invite {
  final String code;
  final Guild? guild;
  final Channel channel;
  final User? inviter;
  final User? targetUser;

  // TODO enum from https://discord.com/developers/docs/resources/invite#invite-object-target-user-types
  final int? targetUserType;
  final int? approximatePresenceCount;
  final int? approximateMemberCount;

  Invite({
    required this.code,
    this.guild,
    required this.channel,
    this.inviter,
    this.targetUser,
    this.targetUserType,
    this.approximatePresenceCount,
    this.approximateMemberCount,
  });

  static Invite fromJson(Map<String, dynamic> json) {
    return Invite(
      code: json['code'],
      guild: ifNotNull(Guild.fromJson, json['guild']),
      channel: Channel.fromJson(json['channel']!),
      inviter: ifNotNull(User.fromJson, json['inviter']),
      targetUser: ifNotNull(User.fromJson, json['target_user']),
      targetUserType: json['target_user_type'],
      approximatePresenceCount: json['approximate_presence_count'],
      approximateMemberCount: json['approximate_member_count'],
    );
  }

  Map toJson() {
    return {
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
