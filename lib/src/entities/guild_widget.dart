library entities;

class GuildWidget {
  final bool enabled;
  final String? snowflake;

  GuildWidget({
    required this.enabled,
    this.snowflake,
  });

  static GuildWidget fromJson(Map<String, dynamic> json) {
    return GuildWidget(
      enabled: json['enabled'],
      snowflake: json['snowflake'],
    );
  }

  Map toJson() {
    return {
      'enabled': enabled,
      'snowflake': snowflake,
    };
  }
}
