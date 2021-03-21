library entities;

import '../../entities.dart';
import '../internal.dart';

class IntegrationApplication {
  final String id;
  final String name;
  final String? icon;
  final String description;
  final String summary;
  final User? bot;

  IntegrationApplication({
    required this.id,
    required this.name,
    this.icon,
    required this.description,
    required this.summary,
    this.bot,
  });

  static IntegrationApplication fromJson(Map<String, dynamic> json) {
    return IntegrationApplication(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      description: json['description'],
      summary: json['summary'],
      bot: ifNotNull(User.fromJson, json['bot']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'summary': summary,
      'bot': bot,
    };
  }
}
