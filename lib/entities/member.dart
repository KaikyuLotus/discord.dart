import 'package:discord/discord.dart';

class Member {
  final User? user;
  final String? nick;
  final List<String> roles;
  final String joinedAt; // TODO timestamp
  final String? premiumSince; // TODO timestamp
  final bool deaf;
  final bool mute;
  final bool? pending;
  final String? permissions;

  Member({
    this.user,
    this.nick,
    required this.roles,
    required this.joinedAt,
    this.premiumSince,
    required this.deaf,
    required this.mute,
    this.pending,
    this.permissions,
  });

  static Member fromJson(Map<String, dynamic> json) {
    return Member(
      user: json['user'],
      nick: json['nick'],
      roles: List<String>.from(json['roles']!),
      joinedAt: json['joined_at']!,
      premiumSince: json['premium_since'],
      deaf: json['deaf'],
      mute: json['mute'],
      pending: json['pending'],
      permissions: json['permissions'],
    );
  }

  Map toJson() {
    return {
      'user': user,
      'nick': nick,
      'roles': roles,
      'joined_at': joinedAt,
      'premium_since': premiumSince,
      'deaf': deaf,
      'mute': mute,
      'pending': pending,
      'permissions': permissions,
    };
  }
}
