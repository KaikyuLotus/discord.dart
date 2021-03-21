library entities;

import '../../entities.dart';

class Template {
  final String code;
  final String name;
  final String? description;
  final int usageCount;
  final String creatorId;
  final User creator;
  final String createdAt;
  final String updatedAt;
  final String sourceGuildId;
  final Guild serializedSourceGuild;
  final bool? isDirty;

  Template({
    required this.code,
    required this.name,
    this.description,
    required this.usageCount,
    required this.creatorId,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.sourceGuildId,
    required this.serializedSourceGuild,
    required this.isDirty,
  });

  static Template fromJson(Map<String, dynamic> json) {
    return Template(
      code: json['code'],
      name: json['name'],
      description: json['description'],
      usageCount: json['usage_count'],
      creatorId: json['creator_id'],
      creator: User.fromJson(json['creator']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      sourceGuildId: json['source_guild_id'],
      serializedSourceGuild: Guild.fromJson(json['serialized_source_guild']),
      isDirty: json['is_dirty'],
    );
  }

  Map toJson() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'usage_count': usageCount,
      'creator_id': creatorId,
      'creator': creator,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'source_guild_id': sourceGuildId,
      'serialized_source_guild': serializedSourceGuild,
      'is_dirty': isDirty,
    };
  }
}
