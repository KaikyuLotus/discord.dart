library entities;

import '../../entities.dart';
import '../internal.dart';

class UpdateStatus {
  final int? since;
  final List<Activity>? activities;
  final UserStatus status;
  final bool afk;

  UpdateStatus({
    required this.status,
    this.activities,
    this.since,
    this.afk = false,
  });

  static UpdateStatus fromJson(Map<String, dynamic> json) {
    return UpdateStatus(
      status: UserStatus.forValue(json['status']),
      activities: fromArray(Activity.fromJson, json['activities']),
      since: json['since'],
      afk: json['afk'],
    );
  }

  Map toJson() {
    return {
      'status': '$status',
      'afk': afk,
      'activities': activities,
      'since': since,
    };
  }
}
