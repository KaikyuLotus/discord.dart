library entities;

import '../../entities.dart';

class Ban {
  final String? reason;
  final User user;

  Ban({
    this.reason,
    required this.user,
  });

  static Ban fromJson(Map<String, dynamic> json) {
    return Ban(
      reason: json['reason'],
      user: User.fromJson(json['user']),
    );
  }

  Map toJson() {
    return {
      'reason': reason,
      'user': user,
    };
  }
}
