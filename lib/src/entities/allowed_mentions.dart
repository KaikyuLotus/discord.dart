library entities;

class AllowedMentions {
  // TODO enum https://discord.com/developers/docs/resources/channel#allowed-mentions-object
  final List<String> parse;
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
    return AllowedMentions(
      parse: List<String>.from(json['parse']),
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
