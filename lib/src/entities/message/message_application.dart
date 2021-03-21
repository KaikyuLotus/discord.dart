library entities;

class MessageApplication {
  final String id;
  final String? coverImage;
  final String description;
  final String? icon;
  final String name;

  MessageApplication({
    required this.id,
    this.coverImage,
    required this.description,
    this.icon,
    required this.name,
  });

  static MessageApplication fromJson(Map<String, dynamic> json) {
    return MessageApplication(
      id: json['id'],
      coverImage: json['cover_image'],
      description: json['description'],
      icon: json['icon'],
      name: json['name'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'cover_image': coverImage,
      'description': description,
      'icon': icon,
      'name': name,
    };
  }
}
