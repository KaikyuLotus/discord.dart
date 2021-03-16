class Account {
  final String id;
  final String name;

  Account({
    required this.id,
    required this.name,
  });

  static Account fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
