class ActivityParty {
  final String? id; // Snowflake
  final List<int>? size;

  ActivityParty({
    this.id,
    this.size,
  });

  static ActivityParty fromJson(Map<String, dynamic> json) {
    return ActivityParty(
      id: json['id'],
      size: json['size'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'animated': size,
    };
  }
}
