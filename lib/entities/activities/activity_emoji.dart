class ActivityEmoji {
  final String name;
  final String? id; // Snowflake
  final bool? animated;

  ActivityEmoji({
    required this.name,
    this.id,
    this.animated,
  });

  Map toJson() {
    return {
      'name': name,
      'id': id,
      'animated': animated,
    };
  }
}
