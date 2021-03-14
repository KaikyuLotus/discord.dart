import 'package:discord/discord.dart';

class Reaction {
  final int count;
  final bool me;
  final Emoji emoji;

  Reaction({
    required this.count,
    required this.me,
    required this.emoji,
  });

  static Reaction fromJson(Map<String, dynamic> json) {
    return Reaction(
      count: json['count']!,
      me: json['me']!,
      emoji: json['emoji']!,
    );
  }

  Map toJson() {
    return {
      'count': count,
      'me': me,
      'emoji': emoji,
    };
  }
}
