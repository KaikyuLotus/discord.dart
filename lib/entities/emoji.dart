import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Emoji {
  final String? id;
  final String name;
  final List<Role>? roles;
  final User? user;
  final bool? requireColons;
  final bool? managed;
  final bool? animated;
  final bool? available;

  Emoji({
    this.id,
    required this.name,
    this.roles,
    this.user,
    this.requireColons,
    this.managed,
    this.animated,
    this.available,
  });

  static Emoji fromJson(Map<String, dynamic> json) {
    return Emoji(
      id: json['id'],
      name: json['name']!,
      roles: fromArray(Role.fromJson, json['roles']),
      user: json['user'],
      requireColons: json['require_colons'],
      managed: json['managed'],
      animated: json['animated'],
      available: json['available'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'roles': roles,
      'user': user,
      'require_colons': requireColons,
      'managed': managed,
      'animated': animated,
      'available': available,
    };
  }
}