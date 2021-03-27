library entities;

import '../../../entities.dart';

class GuildMemberUpdateEvent {
  final String guildId;
  final List<String> roles;
  final User user;
  final String? nick;
  final String joinedAt;
  final String? premiumSince;
  final bool? pending;

  GuildMemberUpdateEvent({
    required this.guildId,
    required this.roles,
    required this.user,
    this.nick,
    required this.joinedAt,
    this.premiumSince,
    this.pending,
  });

  static GuildMemberUpdateEvent fromJson(Map<String, dynamic> json) {
    return GuildMemberUpdateEvent(
      guildId: json['guild_id'],
      roles: List<String>.from(json['roles']),
      user: User.fromJson(json['user']),
      nick: json['nick'],
      joinedAt: json['joined_at'],
      premiumSince: json['premium_since'],
      pending: json['pending'],
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'roles': roles,
      'user': user,
      'nick': nick,
      'joined_at': joinedAt,
      'premium_since': premiumSince,
      'pending': pending,
    };
  }
}
