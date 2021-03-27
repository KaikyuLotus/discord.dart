library entities;

import '../../../entities.dart';
import '../../internal.dart';

class ApplicationCommandInteractionData {
  final String id;
  final String name;
  final List<ApplicationCommandInteractionDataOption>? options;

  ApplicationCommandInteractionData({
    required this.id,
    required this.name,
    this.options,
  });

  static ApplicationCommandInteractionData fromJson(
    Map<String, dynamic> json,
  ) {
    return ApplicationCommandInteractionData(
      id: json['id'],
      name: json['name'],
      options: fromArray(
        ApplicationCommandInteractionDataOption.fromJson,
        json['options'],
      ),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'options': options,
    }..filterNullValues();
  }
}
