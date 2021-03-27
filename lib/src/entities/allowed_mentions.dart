library entities;

import '../../entities.dart';

class AllowedMentions {
  final List<AllowedMentionsType> parse;
  final List<String> roles;
  final List<String> users;
  final bool repliedUser;

  AllowedMentions({
    this.parse = const [],
    this.roles = const [],
    this.users = const [],
    this.repliedUser = false,
  });

  static AllowedMentions fromJson(Map<String, dynamic> json) {
    var parse = json['parse'] as List;
    return AllowedMentions(
      parse: List.generate(
        parse.length,
        (i) => AllowedMentionsType.forValue(parse[i]),
      ),
      roles: List<String>.from(json['roles']),
      users: List<String>.from(json['users']),
      repliedUser: json['repliedUser'],
    );
  }

  Map toJson() {
    return {
      'parse': parse,
      'roles': roles,
      'users': users,
      'replied_user': repliedUser,
    };
  }
}
