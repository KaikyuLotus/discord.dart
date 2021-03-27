library entities;

import '../../entities.dart';
import '../internal.dart';

class GuildPreview {
  final String id;
  final String name;
  final String? icon;
  final String? splash;
  final String? discoverySplash;
  final List<Emoji> emojis;
  final List<GuildFeature> features;
  final int approximateMemberCount;
  final int approximatePresenceCount;
  final String? description;

  GuildPreview({
    required this.id,
    required this.name,
    this.icon,
    this.splash,
    this.discoverySplash,
    required this.emojis,
    required this.features,
    required this.approximateMemberCount,
    required this.approximatePresenceCount,
    this.description,
  });

  static GuildPreview fromJson(Map<String, dynamic> json) {
    var features = json['features'];
    return GuildPreview(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      splash: json['splash'],
      discoverySplash: json['discoverySplash'],
      emojis: fromArray(Emoji.fromJson, json['emojis'])!,
      features: List.generate(
        features.length,
        (i) => GuildFeature.forValue(features[i]),
      ),
      approximateMemberCount: json['approximateMemberCount'],
      approximatePresenceCount: json['approximatePresenceCount'],
      description: json['description'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'splash': splash,
      'discovery_splash': discoverySplash,
      'emojis': emojis,
      'features': features,
      'approximate_member_count': approximateMemberCount,
      'approximate_presence_count': approximatePresenceCount,
      'description': description,
    };
  }
}
