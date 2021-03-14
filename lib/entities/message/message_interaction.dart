import 'package:discord/discord.dart';

class MessageInteraction {
  final String id;
  final int type;
  final String name;
  final User user;

  MessageInteraction({
    required this.id,
    required this.type,
    required this.name,
    required this.user,
  });

  static MessageInteraction fromJson(Map<String, dynamic> json) {
    return MessageInteraction(
      id: json['id'],
      type: json['type'], // InteractionType.fromJson(json['type']),
      name: json['name'],
      user: User.fromJson(json['user']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'user': user,
    };
  }
}
