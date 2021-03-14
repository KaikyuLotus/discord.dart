import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Role {
  final String id;
  final String name;
  final int color;
  final bool hoist;
  final int position;
  final String permissions;
  final bool managed;
  final bool mentionable;
  final RoleTags? tags;

  Role({
    required this.id,
    required this.name,
    required this.color,
    required this.hoist,
    required this.position,
    required this.permissions,
    required this.managed,
    required this.mentionable,
    this.tags,
  });

  static Role fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id']!,
      name: json['name']!,
      color: json['color']!,
      hoist: json['hoist']!,
      position: json['position']!,
      permissions: json['permissions']!,
      managed: json['managed']!,
      mentionable: json['mentionable']!,
      tags: ifNotNull(RoleTags.fromJson, json['tags']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'hoist': hoist,
      'position': position,
      'permissions': permissions,
      'managed': managed,
      'mentionable': mentionable,
      'tags': tags,
    };
  }
}
