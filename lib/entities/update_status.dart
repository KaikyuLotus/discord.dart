import 'package:discord/discord.dart';

class UpdateStatus {
  final int? since;
  final List<UserActivity>? activities;
  final UserStatus status;
  final bool afk;

  UpdateStatus({
    required this.status,
    this.afk = false,
    this.activities,
    this.since,
  });

  Map toJson() {
    return {
      'status': '$status',
      'afk': afk,
      'activities': activities,
      'since': since,
    };
  }
}
