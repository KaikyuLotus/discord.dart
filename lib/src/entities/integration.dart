library entities;

import '../../entities.dart';

class Integration {
  final String id;
  final String name;
  final String type;
  final bool enabled;
  final bool? syncing;
  final String? roleId;
  final bool? enabledEmoticons;

  // TODO enum from https://discord.com/developers/docs/resources/guild#integration-object-integration-expire-behaviors
  final int? expireBehaviour;
  final int? expireGracePeriod;
  final User? user;
  final Account? account;
  final String? syncedAt;
  final int? subscriberCount;
  final bool? revoked;
  final IntegrationApplication? application;

  Integration({
    required this.id,
    required this.name,
    required this.type,
    required this.enabled,
    this.syncing,
    this.roleId,
    this.enabledEmoticons,
    this.expireBehaviour,
    this.expireGracePeriod,
    this.user,
    this.account,
    this.syncedAt,
    this.subscriberCount,
    this.revoked,
    this.application,
  });

  static Integration fromJson(Map<String, dynamic> json) {
    return Integration(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      enabled: json['enabled'],
      syncing: json['syncing'],
      roleId: json['role_id'],
      enabledEmoticons: json['enabled_emoticons'],
      expireBehaviour: json['expire_behaviour'],
      expireGracePeriod: json['expire_grace_period'],
      user: User.fromJson(json['user']),
      account: Account.fromJson(json['account']),
      syncedAt: json['synced_at'],
      subscriberCount: json['subscriber_count'],
      revoked: json['revoked'],
      application: IntegrationApplication.fromJson(json['application']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'enabled': enabled,
      'syncing': syncing,
      'role_id': roleId,
      'enabled_emoticons': enabledEmoticons,
      'expire_behaviour': expireBehaviour,
      'expire_grace_period': expireGracePeriod,
      'user': user,
      'account': account,
      'synced_at': syncedAt,
      'subscriber_count': subscriberCount,
      'revoked': revoked,
      'application': application,
    };
  }
}
