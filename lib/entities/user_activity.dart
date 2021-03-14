import 'package:discord/discord.dart';

class UserActivity {
  final String name;
  final UserActivityType type;
  final String? url;
  final int? createdAt;
  final Timestamp? timestamps;
  final String? applicationId; // Snowflake
  final String? details;
  final String? state;
  final ActivityEmoji? emoji;
  final ActivityParty? party;
  final ActivityAssets? assets;
  final ActivitySecrets? secrets;
  final bool? instance;
  final int? flags;

  UserActivity({
    required this.name,
    required this.type,
    this.url,
    this.createdAt,
    this.timestamps,
    this.applicationId,
    this.details,
    this.state,
    this.emoji,
    this.party,
    this.assets,
    this.secrets,
    this.instance,
    this.flags,
  });

  Map toJson() {
    return {
      'name': name,
      'type': type,
      'url': url,
      'timestamps': timestamps,
      'application_id': applicationId,
      'details': details,
      'state': state,
      'emoji': emoji,
      'party': party,
      'assets': assets,
      'secrets': secrets,
      'instance': instance,
      'flags': flags,
    };
  }
}
