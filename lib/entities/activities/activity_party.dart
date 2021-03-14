class ActivityParty {
  final String? id; // Snowflake
  final List<int>? size;

  ActivityParty({
    this.id,
    this.size,
  });

  Map toJson() {
    return {
      'id': id,
      'animated': size,
    };
  }
}
