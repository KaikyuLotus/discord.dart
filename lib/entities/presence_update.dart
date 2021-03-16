import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class PresenceUpdate {
  final User user;
  final String guildId;
  final String status;
  final List<Activity> activities;
  final ClientStatus clientStatus;

  PresenceUpdate({
    required this.user,
    required this.guildId,
    required this.status,
    required this.activities,
    required this.clientStatus,
  });

  static PresenceUpdate fromJson(Map<String, dynamic> json) {
    return PresenceUpdate(
      user: User.fromJson(json['user']),
      guildId: json['guild_id'],
      status: json['status'],
      activities: fromArray(Activity.fromJson, json['activities'])!,
      clientStatus: ClientStatus.fromJson(json['client_status']),
    );
  }

  Map toJson() {
    return {
      'user': user,
      'guild_id': guildId,
      'status': status,
      'activities': activities,
      'client_status': clientStatus,
    };
  }
}
