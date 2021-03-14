import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Activity {
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

  Activity({
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

  static Activity fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'],
      type: UserActivityType.fromInt(json['type']),
      url: json['url'],
      createdAt: json['createdAt'],
      timestamps: ifNotNull(Timestamp.fromJson, json['timestamps']),
      applicationId: json['applicationId'],
      details: json['details'],
      state: json['state'],
      emoji: ifNotNull(ActivityEmoji.fromJson, json['emoji']),
      party: ifNotNull(ActivityParty.fromJson, json['party']),
      assets: ifNotNull(ActivityAssets.fromJson, json['assets']),
      secrets: ifNotNull(ActivitySecrets.fromJson, json['secrets']),
      instance: json['instance'],
      flags: json['flags'],
    );
  }

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
