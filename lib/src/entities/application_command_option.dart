library entities;

import '../../entities.dart';
import '../internal.dart';

class ApplicationCommandOption {
  // TODO enum from https://discord.com/developers/docs/interactions/slash-commands#applicationcommandoptiontype
  final int type;
  final String name;
  final String description;
  final bool? required;
  final List<ApplicationCommandOptionChoice>? choices;
  final List<ApplicationCommandOption>? options;

  ApplicationCommandOption({
    required this.type,
    required this.name,
    required this.description,
    this.required,
    this.choices,
    this.options,
  });

  static ApplicationCommandOption fromJson(Map<String, dynamic> json) {
    return ApplicationCommandOption(
      type: json['type'],
      name: json['name'],
      description: json['description'],
      required: json['required'],
      choices: fromArray(ApplicationCommandOptionChoice.fromJson, json['choices'],),
      options: fromArray(ApplicationCommandOption.fromJson, json['options']),
    );
  }

  Map toJson() {
    return {
      'type': type,
      'name': name,
      'description': description,
      'required': required,
      'choices': choices,
      'options': options,
    };
  }
}
