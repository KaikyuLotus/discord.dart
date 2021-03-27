library entities;

import '../../entities.dart';
import '../internal.dart';

class GuildMember {
  final User? user;
  final String? nick;
  final List<String> roles;
  final String joinedAt;
  final String? premiumSince;
  final bool deaf;
  final bool mute;
  final bool? pending;
  final String? permissions;

  GuildMember({
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

  static GuildMember fromJson(Map<String, dynamic> json) {
    return GuildMember(
      user: ifNotNull(User.fromJson, json['user']),
      nick: json['nick'],
      roles: List<String>.from(json['roles']),
      joinedAt: json['joined_at'],
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
