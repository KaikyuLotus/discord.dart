library entities;

class ActivityEmoji {
  final String name;
  final String? id; // Snowflake
  final bool? animated;

  ActivityEmoji({
    required this.name,
    this.id,
    this.animated,
  });

  static ActivityEmoji fromJson(Map<String, dynamic> json) {
    return ActivityEmoji(
      name: json['name'],
      id: json['id'],
      animated: json['animated'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'id': id,
      'animated': animated,
    };
  }
}
