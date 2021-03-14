import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Guild {
  final String id;
  final String name;
  final String? icon;
  final String? iconHash;
  final String? splash;
  final String? discoverySplash;
  final bool? owner;
  final String ownerId;
  final String? permissions;
  final String region;
  final String? afkChannelId;
  final int afkTimeout;
  final bool? widgetEnabled;
  final int verificationLevel;
  final int defaultMessageNotifications;
  final int explicitContentFilter;
  final List<Role> roles;
  final List<Emoji> emojis;

  // TODO enum from https://discord.com/developers/docs/resources/guild#guild-object-guild-features
  final List<String> features;
  final int mfaLevel;
  final String? applicationId;
  final String systemChannelId;
  final int systemChannelFlags;
  final String? rulesChannelId;
  final String? joinedAt;
  final bool? large;
  final bool? unavailable;
  final int? memberCount;
  final List<VoiceState>? voiceStates;
  final List<Member>? members;
  final List<Channel>? channels;
  final List<PresenceUpdate>? presences;
  final int? maxPresences;
  final int? maxMembers;
  final String? vanityUrlCode;
  final String? description;
  final String? banner;
  final int premiumTier;
  final int? premiumSubscriptionCount;
  final String preferredLocale;
  final String? publicUpdatesChannelId;
  final int? maxVideoChannelUsers;
  final int? approximateMemberCount;
  final int? approximatePresenceCount;
  final WelcomeScreen? welcomeScreen;

  Guild({
    required this.id,
    required this.name,
    this.icon,
    this.iconHash,
    this.splash,
    this.discoverySplash,
    this.owner,
    required this.ownerId,
    this.permissions,
    required this.region,
    this.afkChannelId,
    required this.afkTimeout,
    this.widgetEnabled,
    required this.verificationLevel,
    required this.defaultMessageNotifications,
    required this.explicitContentFilter,
    required this.roles,
    required this.emojis,
    required this.features,
    required this.mfaLevel,
    this.applicationId,
    required this.systemChannelId,
    required this.systemChannelFlags,
    this.rulesChannelId,
    this.joinedAt,
    this.large,
    this.unavailable,
    this.memberCount,
    this.voiceStates,
    this.members,
    this.channels,
    this.presences,
    this.maxPresences,
    this.maxMembers,
    this.vanityUrlCode,
    this.description,
    this.banner,
    required this.premiumTier,
    this.premiumSubscriptionCount,
    required this.preferredLocale,
    this.publicUpdatesChannelId,
    this.maxVideoChannelUsers,
    this.approximateMemberCount,
    this.approximatePresenceCount,
    this.welcomeScreen,
  });

  static Guild fromJson(Map<String, dynamic> json) {
    return Guild(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      iconHash: json['icon_hash'],
      splash: json['splash'],
      discoverySplash: json['discovery_splash'],
      owner: json['owner'],
      ownerId: json['owner_id'],
      permissions: json['permissions'],
      region: json['region'],
      afkChannelId: json['afk_channel_id'],
      afkTimeout: json['afk_timeout'],
      widgetEnabled: json['widget_enabled'],
      verificationLevel: json['verification_level'],
      defaultMessageNotifications: json['default_message_notifications'],
      explicitContentFilter: json['explicit_content_filter'],
      roles: fromArray(Role.fromJson, json['roles'])!,
      emojis: fromArray(Emoji.fromJson, json['emojis'])!,
      features: List<String>.from(json['features']!),
      mfaLevel: json['mfa_level'],
      applicationId: json['application_id'],
      systemChannelId: json['system_channel_id'],
      systemChannelFlags: json['system_channel_flags'],
      rulesChannelId: json['rules_channel_id'],
      joinedAt: json['joined_at'],
      large: json['large'],
      unavailable: json['unavailable'],
      memberCount: json['member_count'],
      voiceStates: fromArray(VoiceState.fromJson, json['voice_states']),
      members: fromArray(Member.fromJson, json['members']),
      channels: fromArray(Channel.fromJson, json['channels']),
      presences: fromArray(PresenceUpdate.fromJson, json['presences']),
      maxPresences: json['max_presences'],
      maxMembers: json['max_members'],
      vanityUrlCode: json['vanity_url_code'],
      description: json['description'],
      banner: json['banner'],
      premiumTier: json['premium_tier'],
      premiumSubscriptionCount: json['premium_subscription_count'],
      preferredLocale: json['preferred_locale'],
      publicUpdatesChannelId: json['public_updates_channel_id'],
      maxVideoChannelUsers: json['max_video_channel_users'],
      approximateMemberCount: json['approximate_member_count'],
      approximatePresenceCount: json['approximate_presence_count'],
      welcomeScreen: ifNotNull(WelcomeScreen.fromJson, json['welcome_screen']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'icon_hash': iconHash,
      'splash': splash,
      'discovery_splash': discoverySplash,
      'owner': owner,
      'owner_id': ownerId,
      'permissions': permissions,
      'region': region,
      'afk_channel_id': afkChannelId,
      'afk_timeout': afkTimeout,
      'widget_enabled': widgetEnabled,
      'verification_level': verificationLevel,
      'default_message_notifications': defaultMessageNotifications,
      'explicit_content_filter': explicitContentFilter,
      'roles': roles,
      'emojis': emojis,
      'features': features,
      'mfa_level': mfaLevel,
      'application_id': applicationId,
      'system_channel_id': systemChannelId,
      'system_channel_flags': systemChannelFlags,
      'rules_channel_id': rulesChannelId,
      'joined_at': joinedAt,
      'large': large,
      'unavailable': unavailable,
      'member_count': memberCount,
      'voice_states': voiceStates,
      'members': members,
      'channels': channels,
      'presences': presences,
      'max_presences': maxPresences,
      'max_members': maxMembers,
      'vanity_url_code': vanityUrlCode,
      'description': description,
      'banner': banner,
      'premium_tier': premiumTier,
      'premium_subscription_count': premiumSubscriptionCount,
      'preferred_locale': preferredLocale,
      'public_updates_channel_id': publicUpdatesChannelId,
      'max_video_channel_users': maxVideoChannelUsers,
      'approximate_member_count': approximateMemberCount,
      'approximate_presence_count': approximatePresenceCount,
      'welcome_screen': welcomeScreen,
    };
  }
}
