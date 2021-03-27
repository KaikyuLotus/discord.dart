library entities;

class ApplicationCommandOptionChoice {
  final String name;

  /// String or int
  final dynamic value;

  ApplicationCommandOptionChoice({required this.name, this.value});

  static ApplicationCommandOptionChoice fromJson(Map<String, dynamic> json) {
    return ApplicationCommandOptionChoice(
      name: json['name'],
      value: json['value'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'value': value,
    };
  }
}
