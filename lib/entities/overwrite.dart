class Overwrite {
  final String id;

  // TODO enum either 0 (role) or 1 (member)
  final int type;
  final String allow;
  final String deny;

  Overwrite({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny,
  });

  static Overwrite fromJson(Map<String, dynamic> json) {
    return Overwrite(
      id: json['id'],
      type: json['type'],
      allow: json['allow'],
      deny: json['deny'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'type': type,
      'allow': allow,
      'deny': deny,
    };
  }
}
