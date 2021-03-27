library entities;

import '../../entities.dart';
import '../internal.dart';

class ApplicationCommand {
  final String id;
  final String applicationId;
  final String name;
  final String description;
  final List<ApplicationCommandOption>? options;

  /// Only present in APPLICATION_COMMAND_CREATE
  final String? guildId;

  ApplicationCommand({
    required this.id,
    required this.applicationId,
    required this.name,
    required this.description,
    this.options,
    this.guildId,
  });

  static ApplicationCommand fromJson(Map<String, dynamic> json) {
    return ApplicationCommand(
      id: json['id'],
      applicationId: json['applicationId'],
      name: json['name'],
      description: json['description'],
      options: fromArray(ApplicationCommandOption.fromJson, json['options']),
      guildId: json['guild_id'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'application_id': applicationId,
      'name': name,
      'description': description,
      'options': options,
      'guild_id': guildId,
    };
  }
}
