library entities;

class PartialApplication {
  final String id;
  final int flags;

  PartialApplication({
    required this.id,
    required this.flags,
  });

  static PartialApplication fromJson(Map<String, dynamic> json) {
    return PartialApplication(
      id: json['id'],
      flags: json['flags'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'flags': flags,
    };
  }
}
