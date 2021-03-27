library entities;

import '../../../entities.dart';
import '../../internal.dart';

class ApplicationCommandInteractionDataOption {
  final String name;

  /// Type is based on option
  final dynamic? value;
  final List<ApplicationCommandInteractionDataOption>? options;

  ApplicationCommandInteractionDataOption({
    required this.name,
    this.value,
    this.options,
  });

  static ApplicationCommandInteractionDataOption fromJson(
    Map<String, dynamic> json,
  ) {
    return ApplicationCommandInteractionDataOption(
      name: json['name'],
      value: json['value'],
      options: fromArray(
        ApplicationCommandInteractionDataOption.fromJson,
        json['options'],
      ),
    );
  }

  Map toJson() {
    return {
      'name': name,
      'value': value,
      'options': options,
    }..filterNullValues();
  }
}
