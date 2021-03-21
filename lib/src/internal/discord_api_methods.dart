library discord;

import '../../entities.dart';
import '../internal.dart';

class GuildsAPI {
  final DiscordHTTPClient _http;

  const GuildsAPI(this._http);

  Future<Guild> get(String guildId, {bool withCounts = false}) {
    var endpoint = '/guilds/$guildId';
    return _http.request(endpoint, converter: Guild.fromJson);
  }

  Future<GuildPreview> getGuildPreview(String guildId) {
    var endpoint = '/guilds/$guildId/preview';
    return _http.request(endpoint, converter: GuildPreview.fromJson);
  }

  Future<Guild> modifyGuild(
    String guildId, {
    String? name,
    String? region = '',
    // TODO https://discord.com/developers/docs/resources/guild#guild-object-verification-level
    int? verificationLevel = -1,
    // TODO https://discord.com/developers/docs/resources/guild#guild-object-default-message-notification-level
    int? defaultMessageNotifications = -1,
    // TODO https://discord.com/developers/docs/resources/guild#guild-object-explicit-content-filter-level
    int? explicitContentFilter = -1,
    String? afkChannelId = '',
    int? afkTimeout,
    String? icon = '',
    String? ownerId,
    String? splash = '',
    String? banner = '',
    String? systemChannelId = '',
    String? rulesChannelId = '',
    String? publicUpdatesChannelId = '',
    String? preferredLocale = '',
  }) {
    var endpoint = '/guilds/$guildId';
    return _http.request(
      endpoint,
      converter: Guild.fromJson,
      method: 'patch',
      body: {
        ...insertNotNull('name', name),
        ...insertNotDefault('region', region, ''),
        ...insertNotDefault('verification_level', verificationLevel, -1),
        ...insertNotDefault(
          'default_message_notifications',
          defaultMessageNotifications,
          -1,
        ),
        ...insertNotDefault(
          'explicit_content_filter',
          explicitContentFilter,
          -1,
        ),
        ...insertNotDefault('afk_channel_id', afkChannelId, ''),
        ...insertNotNull('afk_timeout', afkTimeout),
        ...insertNotDefault('icon', icon, ''),
        ...insertNotDefault('owner_id', ownerId, ''),
        ...insertNotDefault('splash', splash, ''),
        ...insertNotDefault('banner', banner, ''),
        ...insertNotDefault('system_channel_id', systemChannelId, ''),
        ...insertNotDefault('rules_channel_id', rulesChannelId, ''),
        ...insertNotDefault(
          'public_updates_channel_id',
          publicUpdatesChannelId,
          '',
        ),
        ...insertNotDefault('preferred_locale', preferredLocale, ''),
      },
    );
  }

  Future delete(String guildId) {
    var endpoint = '/guilds/$guildId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future<List<Channel>> getGuildChannels(String guildId) {
    var endpoint = '/guilds/$guildId/channels';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Channel.fromJson),
    );
  }

  // TODO channel type enum https://discord.com/developers/docs/resources/channel#channel-object-channel-types
  Future<Channel> createChannel(
    String guildId, {
    required String name,
    int? type,
    String? topic,
    int? bitrate,
    int? userLimit,
    int? rateLimitPerUser,
    int? position,
    List<Overwrite>? permissionOverwrites,
    String? parentId,
    bool? nsfw,
  }) {
    var endpoint = '/guilds/$guildId/channels';
    return _http.request(
      endpoint,
      converter: Channel.fromJson,
      method: 'post',
      body: {
        'name': name,
        'type': type,
        'topic': topic,
        'bitrate': bitrate,
        'user_limit': userLimit,
        'rate_limit_per_user': rateLimitPerUser,
        'position': position,
        'permission_overwrites': permissionOverwrites,
        'parent_id': parentId,
        'nsfw': nsfw,
      }..filterNullValues(),
    );
  }

  Future modifyChannelPositions(
    String guildId, {
    required Map<String, int?> positions,
  }) {
    var endpoint = '/guilds/$guildId/channels';
    return _http.request(
      endpoint,
      converter: _http.asNull,
      method: 'patch',
      body: positions.entries
          .map((e) => {'id': e.key, 'position': e.value})
          .toList(),
    );
  }

  Future<Member> getGuildMember(String guildId, String userId) {
    var endpoint = '/guilds/$guildId/members/$userId';
    return _http.request(endpoint, converter: Member.fromJson);
  }

  Future<List<Member>> listGuildMembers(
    String guildId, {
    int? limit,
    String? after,
  }) {
    var endpoint = '/guilds/$guildId/members';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Member.fromJson),
      query: {
        ...insertNotNull('limit', limit, str: true),
        ...insertNotNull('after', after, str: true),
      },
    );
  }

  // TODO method https://discord.com/developers/docs/resources/guild#add-guild-member

  Future<Member> modifyGuildMember(
    String guildId,
    String userId, {
    String? nick = '',
    List<String>? roles,
    bool? mute,
    bool? deaf,
    String? channelId = '',
  }) {
    var endpoint = '/guilds/$guildId/members/$userId';
    return _http.request(
      endpoint,
      converter: Member.fromJson,
      method: 'patch',
      body: {
        ...insertNotDefault('nick', nick, ''),
        ...insertNotNull('roles', roles),
        ...insertNotNull('mute', mute),
        ...insertNotNull('deaf', deaf),
        ...insertNotDefault('channel_id', channelId, ''),
      },
    );
  }

  Future<String> modifyCurrentUserNick(String guildId, String? nick) {
    var endpoint = '/guilds/$guildId/members/@me/nick';
    return _http.request(
      endpoint,
      converter: (s) => s as String,
      method: 'patch',
      body: {'nick': nick},
    );
  }

  Future addMemberRole(
    String guildId, {
    required String userId,
    required String roleId,
  }) {
    var endpoint = '/guilds/$guildId/members/$userId/roles/$roleId';
    return _http.request(endpoint, converter: _http.asNull, method: 'put');
  }

  Future removeMemberRole(
    String guildId, {
    required String userId,
    required String roleId,
  }) {
    var endpoint = '/guilds/$guildId/members/$userId/roles/$roleId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future removeMember(String guildId, String userId) {
    var endpoint = '/guilds/$guildId/members/$userId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future getBans(String guildId) {
    var endpoint = '/guilds/$guildId/bans';
    return _http.request(endpoint, converter: _http.listMapper(Ban.fromJson));
  }

  Future<Ban> getBan(String guildId, String userId) {
    var endpoint = '/guilds/$guildId/bans/$userId';
    return _http.request(endpoint, converter: Ban.fromJson);
  }

  Future createBan(
    String guildId,
    String userId, {
    int? deleteMessageDays,
    String? reason,
  }) {
    var endpoint = '/guilds/$guildId/bans/$userId';
    return _http.request(
      endpoint,
      converter: _http.asNull,
      method: 'put',
      body: {
        ...insertNotNull('delete_message_days', deleteMessageDays),
        ...insertNotNull('reason', reason)
      },
    );
  }

  Future removeBan(String guildId, String userId) {
    var endpoint = '/guilds/$guildId/bans/$userId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future<List<Role>> getRoles(String guildId) {
    var endpoint = '/guilds/$guildId/roles';
    return _http.request(endpoint, converter: _http.listMapper(Role.fromJson));
  }

  Future<Role> createRole(
    String guildId, {
    String? name,
    String? permissions,
    int? color,
    bool? hoist,
    bool? mentionable,
  }) {
    var endpoint = '/guilds/$guildId/roles';
    return _http.request(
      endpoint,
      converter: Role.fromJson,
      method: 'post',
      body: {
        ...insertNotNull('name', name),
        ...insertNotNull('permissions', permissions),
        ...insertNotNull('color', color),
        ...insertNotNull('hoist', hoist),
        ...insertNotNull('mentionable', mentionable),
      },
    );
  }

  Future<List<Role>> modifyRolePositions(
    String guildId,
    Map<String, int> positions,
  ) {
    var endpoint = '/guilds/$guildId/roles';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Role.fromJson),
      method: 'patch',
      body: positions.entries
          .map((e) => {'id': e.key, 'position': e.value})
          .toList(),
    );
  }

  // TODO ugly
  Future<Role> modifyRole(
    String guildId,
    String roleId, {
    String? name = '',
    String? permissions = '',
    int? color = -1,
    bool? hoist,
    bool? mentionable,
  }) {
    var endpoint = '/guilds/$guildId/roles/$roleId';
    return _http.request(
      endpoint,
      converter: Role.fromJson,
      method: 'patch',
      body: {
        ...insertNotDefault('name', name, ''),
        ...insertNotDefault('permissions', permissions, ''),
        ...insertNotDefault('color', color, -1, str: true),
        ...insertNotNull('hoist', hoist),
        ...insertNotNull('mentionable', mentionable),
      },
    );
  }

  Future deleteRole(String guildId, String roleId) {
    var endpoint = '/guilds/$guildId/roles/$roleId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future<int> getPruneCount(
    String guildId, {
    int? days,
    List<String>? includeRoles,
  }) {
    var endpoint = '/guilds/$guildId/prune';
    return _http.request(
      endpoint,
      converter: (j) => j['pruned'],
      query: {
        ...insertNotNull('days', days, str: true),
        ...insertNotNull('include_roles', includeRoles?.join(';')),
      },
    );
  }

  Future<int?> beginPrune(
    String guildId, {
    int? days,
    List<String>? includeRoles,
    bool? computePruneCount,
  }) {
    var endpoint = '/guilds/$guildId/prune';
    return _http.request(
      endpoint,
      converter: (j) => j['pruned'],
      method: 'post',
      query: {
        ...insertNotNull('days', days, str: true),
        ...insertNotNull('compute_prune_count', computePruneCount, str: true),
        ...insertNotNull('include_roles', includeRoles?.join(';')),
      },
    );
  }

  Future<List<VoiceRegion>> getVoiceRegions(String guildId) {
    var endpoint = '/guilds/$guildId/regions';
    return _http.request(
      endpoint,
      converter: _http.listMapper(VoiceRegion.fromJson),
    );
  }

  // TODO entity from https://discord.com/developers/docs/resources/invite#invite-metadata-object
  Future<List<InviteMetadata>> getInvites(String guildId) {
    var endpoint = '/guilds/$guildId/invites';
    return _http.request(
      endpoint,
      converter: _http.listMapper(InviteMetadata.fromJson),
    );
  }

  Future<List<Integration>> getIntegrations(String guildId) {
    var endpoint = '/guilds/$guildId/integrations';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Integration.fromJson),
    );
  }

  Future createIntegration(
    String guildId, {
    required String type,
    required String id,
  }) {
    var endpoint = '/guilds/$guildId/integrations';
    return _http.request(
      endpoint,
      method: 'post',
      converter: _http.listMapper(Integration.fromJson),
      body: {
        'type': type,
        'id': id,
      },
    );
  }

  Future modifyIntegration(
    String guildId, {
    required String integrationId,
    String? expireBehavior = '',
    String? expireGracePeriod = '',
    String? enableEmoticons = '',
  }) {
    var endpoint = '/guilds/$guildId/integrations/$integrationId';
    return _http.request(
      endpoint,
      method: 'patch',
      converter: _http.listMapper(Integration.fromJson),
      body: {
        ...insertNotDefault('expire_behavior', expireBehavior, ''),
        ...insertNotDefault('expire_grace_period', expireGracePeriod, ''),
        ...insertNotDefault('enable_emoticons', enableEmoticons, ''),
      },
    );
  }

  Future deleteIntegration(String guildId, String integrationId) {
    var endpoint = '/guilds/$guildId/integrations/$integrationId';
    return _http.request(
      endpoint,
      method: 'delete',
      converter: _http.asNull,
    );
  }

  Future syncIntegration(String guildId, String integrationId) {
    var endpoint = '/guilds/$guildId/integrations/$integrationId/sync';
    return _http.request(
      endpoint,
      method: 'post',
      converter: _http.asNull,
    );
  }

  Future<GuildWidget> getWidgetSettings(String guildId) {
    var endpoint = '/guilds/$guildId/widget';
    return _http.request(
      endpoint,
      converter: GuildWidget.fromJson,
    );
  }

  Future<GuildWidget> modifyWidget(String guildId, GuildWidget widget) {
    var endpoint = '/guilds/$guildId/widget';
    return _http.request(
      endpoint,
      method: 'patch',
      converter: GuildWidget.fromJson,
      body: widget.toJson(),
    );
  }

  Future<Map<String, dynamic>> getWidget(String guildId) {
    var endpoint = '/guilds/$guildId/widget.json';
    return _http.request(
      endpoint,
      converter: (j) => j,
    );
  }

  Future<PartialInvite> getVanityUrl(String guildId) {
    var endpoint = '/guilds/$guildId/vanity-url';
    return _http.request(
      endpoint,
      converter: PartialInvite.fromJson,
    );
  }

  // TODO Enum from Widget Style Options
  // TODO check output
  Future<String> getWidgetImage(String guildId, String style) {
    var endpoint = '/guilds/$guildId/widget.png';
    return _http.request(
      endpoint,
      converter: (j) => j as String,
      query: {'style': style},
    );
  }
}

class AuditLogAPI {
  final DiscordHTTPClient _http;

  const AuditLogAPI(this._http);

  Future<AuditLogs> getGuildAuditLog(String guildId) {
    var endpoint = '/guilds/$guildId/audit-logs';
    return _http.request(endpoint, converter: AuditLogs.fromJson);
  }
}

class ChannelAPI {
  final DiscordHTTPClient _http;

  const ChannelAPI(this._http);

  Future<Channel> get(String channelId) {
    var endpoint = '/channels/$channelId';
    return _http.request(endpoint, converter: Channel.fromJson);
  }

  Future<Channel> modify(
    String channelId, {
    String? name,
    int? type,
    int? position,
    String? topic,
    bool? nsfw,
    int? rateLimitPerUser,
    int? bitrate,
    int? userLimit,
    List<Overwrite>? permissionOverwrites,
    String? parentId,
  }) {
    var endpoint = '/channels/$channelId';
    return _http.request(
      endpoint,
      converter: Channel.fromJson,
      method: 'patch',
      body: {
        ...insertNotNull('name', name),
        ...insertNotNull('type', type),
        'position': position,
        'topic': topic,
        'nsfw': nsfw,
        'rate_limit_per_user': rateLimitPerUser,
        'bitrate': bitrate,
        'user_limit': userLimit,
        'permission_overwrites': permissionOverwrites,
        'parent_id': parentId,
      },
    );
  }

  Future<Channel> delete(String channelId) {
    var endpoint = '/channels/$channelId';
    return _http.request(
      endpoint,
      converter: Channel.fromJson,
      method: 'delete',
    );
  }

  Future<List<Message>> getMessages(
    String channelId, {
    String? around,
    String? before,
    String? after,
    int? limit,
  }) {
    var endpoint = '/channels/$channelId/messages';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Message.fromJson),
      method: 'get',
      query: {
        'around': around,
        'before': before,
        'after': after,
        'limit': limit == null ? null : '$limit',
      }..filterNullValues(),
    );
  }

  Future<Message> getMessage(String channelId, String messageId) {
    var endpoint = '/channels/$channelId/messages/$messageId';
    return _http.request(endpoint, converter: Message.fromJson);
  }

  Future<Message> createMessage(
    String channelId, {
    required String content,
    String? nonce,
    bool tts = false,
    Embed? embed,
    AllowedMentions? allowedMentions,
    MessageReference? messageReference,
  }) {
    var endpoint = '/channels/$channelId/messages';
    return _http.request(
      endpoint,
      converter: Message.fromJson,
      method: 'post',
      body: {
        'content': content,
        'nonce': nonce,
        'embed': embed,
        'allowed_mentions': allowedMentions,
        'message_reference': messageReference,
      },
    );
  }

  Future<Message> crosspostMessage(String channelId, String messageId) {
    var endpoint = '/channels/$channelId/messages/$messageId/crosspost';
    return _http.request(endpoint, converter: Message.fromJson, method: 'post');
  }

  Future createReaction(
    String channelId, {
    required String messageId,
    required String emoji,
  }) {
    var endp = '/channels/$channelId/messages/$messageId/reactions/$emoji/@me';
    return _http.request(endp, converter: _http.asNull, method: 'put');
  }

  Future deleteOwnReaction(
    String channelId, {
    required String messageId,
    required String emoji,
  }) {
    var endp = '/channels/$channelId/messages/$messageId/reactions/$emoji/@me';
    return _http.request(endp, converter: _http.asNull, method: 'delete');
  }

  Future deleteUserReaction(
    String channelId, {
    required String messageId,
    required String userId,
    required String emoji,
  }) {
    var endp = '/channels/$channelId/messages/'
        '$messageId/reactions/$emoji/$userId';
    return _http.request(endp, converter: _http.asNull, method: 'delete');
  }

  Future<List<User>> getReactions(
    String channelId, {
    required String messageId,
    required String emoji,
  }) {
    var endpoint = '/channels/$channelId/messages/$messageId/reactions/$emoji';
    return _http.request(
      endpoint,
      converter: _http.listMapper(User.fromJson),
      method: 'get',
    );
  }

  Future deleteAllReaction(
    String channelId,
    String messageId, {
    String? emoji,
  }) {
    var endp = '/channels/$channelId/messages/$messageId/reactions';
    if (emoji != null) {
      endp += '/$emoji';
    }
    return _http.request(endp, converter: _http.asNull, method: 'delete');
  }

  Future<Message> editMessage(
    String channelId, {
    required String messageId,
    String? content,
    Embed? embed,
    int? flags,
    AllowedMentions? allowedMentions,
  }) {
    var endpoint = '/channels/$channelId/messages/$messageId';
    return _http
        .request(endpoint, converter: Message.fromJson, method: 'patch', body: {
      ...insertNotNull('content', content),
      ...insertNotNull('embed', embed),
      ...insertNotNull('flags', flags),
      ...insertNotNull('allowedMentions', allowedMentions),
    });
  }

  Future deleteMessage(String channelId, String messageId) {
    var endpoint = '/channels/$channelId/messages/$messageId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future bulkDeleteMessages(
    String channelId, {
    required List<String> messages,
  }) {
    var endpoint = '/channels/$channelId/messages/bulk-delete';
    return _http.request(
      endpoint,
      converter: _http.asNull,
      method: 'post',
      body: {
        'messages': messages,
      },
    );
  }

  // See https://discord.com/developers/docs/topics/permissions#permissions
  Future editPermissions(
    String channelId, {
    required String overwriteId,
    required String allow,
    required String deny,
    required int type,
  }) {
    var endpoint = '/channels/$channelId/permissions/$overwriteId';
    return _http.request(
      endpoint,
      converter: _http.asNull,
      method: 'put',
      body: {
        'allow': allow,
        'deny': deny,
        'type': type,
      },
    );
  }

  Future<List<Invite>> getInvites(String channelId) {
    var endpoint = '/channels/$channelId/invites';
    return _http.request(endpoint,
        converter: _http.listMapper(Invite.fromJson));
  }

  Future createInvite(
    String channelId, {
    int? maxAge, //seconds
    int? maxUses,
    bool? temporary,
    bool? unique,
    String? targetUser,
    String? targetUserType,
  }) {
    var endpoint = '/channels/$channelId/invites';
    return _http.request(
      endpoint,
      converter: _http.asNull,
      method: 'post',
      body: {
        ...insertNotNull('max_age', maxAge),
        ...insertNotNull('max_uses', maxUses),
        ...insertNotNull('temporary', temporary),
        ...insertNotNull('unique', unique),
        ...insertNotNull('target_user', targetUser),
        ...insertNotNull('target_user_type', targetUserType),
      },
    );
  }

  Future deletePermission(String channelId, String overwriteId) {
    var endpoint = '/channels/$channelId/permissions/$overwriteId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future<FollowedChannel> followNewsChannel(
    String channelId, {
    required String webhookChannelId,
  }) {
    var endpoint = '/channels/$channelId/followers';
    return _http.request(
      endpoint,
      converter: FollowedChannel.fromJson,
      method: 'post',
      body: {
        'webhook_channel_id': webhookChannelId,
      },
    );
  }

  Future triggerTypingIndicator(String channelId) {
    var endpoint = '/channels/$channelId/typing';
    return _http.request(endpoint, converter: _http.asNull, method: 'post');
  }

  Future<List<Message>> getPinnedMessages(String channelId) {
    var endpoint = '/channels/$channelId/pins';
    return _http.request(endpoint,
        converter: _http.listMapper(Message.fromJson));
  }

  Future addPinnedMessage(String channelId, String messageId) {
    var endpoint = '/channels/$channelId/pins/$messageId';
    return _http.request(endpoint, converter: _http.asNull, method: 'put');
  }

  Future deletePinnedMessage(String channelId, String messageId) {
    var endpoint = '/channels/$channelId/pins/$messageId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }

  Future groupDMAddRecipient(
    String channelId, {
    required String userId,
    required String accessToken,
    required String nick,
  }) {
    var endpoint = '/channels/$channelId/recipients/$userId';
    return _http.request(
      endpoint,
      converter: _http.asNull,
      method: 'put',
      body: {
        'access_token': accessToken,
        'nick': nick,
      },
    );
  }

  Future groupDMRemoveRecipient(String channelId, String userId) {
    var endpoint = '/channels/$channelId/recipients/$userId';
    return _http.request(endpoint, converter: _http.asNull, method: 'delete');
  }
}

class EmojiAPI {
  final DiscordHTTPClient _http;

  const EmojiAPI(this._http);

  Future<List<Emoji>> listGuildEmojis(String guildId) {
    var endpoint = '/guilds/$guildId/emojis';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Emoji.fromJson),
    );
  }

  Future<Emoji> getGuildEmoji(String guildId, String emojiId) {
    var endpoint = '/guilds/$guildId/emojis/$emojiId';
    return _http.request(
      endpoint,
      converter: Emoji.fromJson,
    );
  }

  Future<Emoji> createGuildEmoji(
    String guildId, {
    required String name,
    required String image,
    required List<String> roles,
  }) {
    var endpoint = '/guilds/$guildId/emojis';
    return _http.request(
      endpoint,
      method: 'post',
      converter: Emoji.fromJson,
      body: {
        'name': name,
        'image': image,
        'roles': roles,
      },
    );
  }

  Future<Emoji> modifyGuildEmoji(
    String guildId, {
    required String emojiId,
    required String name,
    required List<String> roles,
  }) {
    var endpoint = '/guilds/$guildId/emojis/$emojiId';
    return _http.request(
      endpoint,
      method: 'patch',
      converter: Emoji.fromJson,
      body: {
        'name': name,
        'roles': roles,
      },
    );
  }

  Future deleteGuildEmoji(String guildId, String emojiId) {
    var endpoint = '/guilds/$guildId/emojis/$emojiId';
    return _http.request(
      endpoint,
      method: 'delete',
      converter: _http.asNull,
    );
  }
}

class InviteAPI {
  final DiscordHTTPClient _http;

  const InviteAPI(this._http);

  Future<Invite> getInvite(String inviteCode, {int? withCounts}) {
    var endpoint = '/invites/$inviteCode';
    return _http.request(
      endpoint,
      converter: Invite.fromJson,
      query: {
        ...insertNotNull('with_counts', withCounts),
      },
    );
  }

  Future<Invite> deleteInvite(String inviteCode) {
    var endpoint = '/invites/$inviteCode';
    return _http.request(
      endpoint,
      method: 'delete',
      converter: Invite.fromJson,
    );
  }
}

class TemplateAPI {
  final DiscordHTTPClient _http;

  const TemplateAPI(this._http);

  Future<Template> getTemplate(String templateCode) {
    var endpoint = '/guilds/templates/$templateCode';
    return _http.request(endpoint, converter: Template.fromJson);
  }

  Future<Guild> createGuildFromTemplate(
    String templateCode, {
    required String name,
    String? icon,
  }) {
    var endpoint = '/guilds/templates/$templateCode';
    return _http.request(
      endpoint,
      method: 'post',
      converter: Guild.fromJson,
      body: {
        'name': name,
        ...insertNotNull('icon', icon),
      },
    );
  }

  Future<List<Template>> getTemplates(String guildId) {
    var endpoint = '/guilds/$guildId/templates';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Template.fromJson),
    );
  }

  Future<Template> createTemplate(
    String guildId, {
    required String name,
    String? description = '',
  }) {
    var endpoint = '/guilds/$guildId/templates';
    return _http.request(
      endpoint,
      method: 'post',
      converter: Template.fromJson,
      body: {
        'name': name,
        ...insertNotDefault('description', description, ''),
      },
    );
  }

  Future<Template> syncTemplate(String guildId, String templateCode) {
    var endpoint = '/guilds/$guildId/templates/$templateCode';
    return _http.request(
      endpoint,
      method: 'put',
      converter: Template.fromJson,
    );
  }

  Future<Template> modifyTemplate(
    String guildId,
    String templateCode, {
    String? name,
    String? description = '',
  }) {
    var endpoint = '/guilds/$guildId/templates/$templateCode';
    return _http.request(
      endpoint,
      method: 'patch',
      converter: Template.fromJson,
      body: {
        ...insertNotNull('name', name),
        ...insertNotDefault('description', description, ''),
      },
    );
  }

  Future<Template> deleteTemplate(String guildId, String templateCode) {
    var endpoint = '/guilds/$guildId/templates/$templateCode';
    return _http.request(
      endpoint,
      method: 'delete',
      converter: Template.fromJson,
    );
  }
}

class UserAPI {
  final DiscordHTTPClient _http;

  const UserAPI(this._http);

  Future<User> getCurrentUser() {
    var endpoint = '/users/@me';
    return _http.request(endpoint, converter: User.fromJson);
  }

  Future<User> modifyCurrentUser({
    String? username,
    String? avatar = '',
  }) {
    var endpoint = '/users/@me';
    return _http.request(
      endpoint,
      method: 'patch',
      converter: User.fromJson,
      body: {
        ...insertNotNull('username', username),
        ...insertNotDefault('avatar', avatar, ''),
      },
    );
  }

  Future<List<Guild>> getCurrentUserGuilds({
    String? before,
    String? after,
    int? limit,
  }) {
    var endpoint = '/users/@me/guilds';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Guild.fromJson),
      query: {
        ...insertNotNull('before', before),
        ...insertNotNull('after', after),
        ...insertNotNull('limit', limit),
      },
    );
  }

  Future leaveGuild(String guildId) {
    var endpoint = '/users/@me/guilds/$guildId';
    return _http.request(
      endpoint,
      method: 'delete',
      converter: _http.asNull,
    );
  }

  /// Returns empty array for bots
  Future<List<Channel>> getUserDMs() {
    var endpoint = '/users/@me/channels';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Channel.fromJson),
    );
  }

  Future<Channel> createDM(String recipientId) {
    var endpoint = '/users/@me/channels';
    return _http.request(
      endpoint,
      method: 'post',
      converter: Channel.fromJson,
      body: {'recipient_id': recipientId},
    );
  }

  @deprecated
  Future<Channel> createGroupDM(
    List<String> accessTokens,
    Map<String, String> nicks,
  ) {
    var endpoint = '/users/@me/channels';
    return _http.request(
      endpoint,
      method: 'post',
      converter: Channel.fromJson,
      body: {
        'access_tokens': accessTokens,
        'nicks': nicks,
      },
    );
  }

  Future<List<Connection>> getUserConnections() {
    var endpoint = '/users/@me/connections';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Connection.fromJson),
    );
  }
}

class VoiceAPI {
  final DiscordHTTPClient _http;

  const VoiceAPI(this._http);

  Future<List<VoiceRegion>> listVoiceRegions() {
    var endpoint = '/voice/regions';
    return _http.request(
      endpoint,
      converter: _http.listMapper(VoiceRegion.fromJson),
    );
  }
}

class WebhookAPI {
  final DiscordHTTPClient _http;

  const WebhookAPI(this._http);

  Future<Webhook> createWebhook(
    String channelId, {
    required String name,
    String? imageData,
  }) {
    var endpoint = '/channels/$channelId/webhooks';
    return _http.request(
      endpoint,
      method: 'post',
      converter: Webhook.fromJson,
      body: {
        'name': name,
        'image_data': imageData,
      },
    );
  }

  Future<List<Webhook>> getChannelWebhooks(String channelId) {
    var endpoint = '/channels/$channelId/webhooks';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Webhook.fromJson),
    );
  }

  Future<List<Webhook>> getGuildWebhooks(String guildId) {
    var endpoint = '/channels/$guildId/webhooks';
    return _http.request(
      endpoint,
      converter: _http.listMapper(Webhook.fromJson),
    );
  }

  Future<Webhook> getWebhook(String webhookId, {String? webhookToken}) {
    var endpoint = '/webhooks/$webhookId';
    if (webhookToken != null) {
      endpoint += '/$webhookToken';
    }
    return _http.request(endpoint, converter: Webhook.fromJson);
  }

  Future<Webhook> modifyWebhook(
    String webhookId, {
    String? name,
    String? avatar = '',
    String? channelId,
  }) {
    var endpoint = '/webhooks/$webhookId';
    return _http.request(
      endpoint,
      converter: Webhook.fromJson,
      method: 'patch',
      body: {
        ...insertNotNull('name', name),
        ...insertNotDefault('avatar', avatar, ''),
        ...insertNotNull('channel_id', channelId),
      },
    );
  }

  Future<Webhook> modifyWebhookWithToken(
    String webhookId, {
    required String webhookToken,
    String? name,
    String? avatar = '',
  }) {
    var endpoint = '/webhooks/$webhookId/$webhookToken';
    return _http.request(
      endpoint,
      converter: Webhook.fromJson,
      method: 'patch',
      body: {
        ...insertNotNull('name', name),
        ...insertNotDefault('avatar', avatar, ''),
      },
    );
  }

  Future deleteWebhook(String webhookId, {String? webhookToken}) {
    var endpoint = '/webhooks/$webhookId';
    if (webhookToken != null) {
      endpoint += '/$webhookToken';
    }
    return _http.request(
      endpoint,
      method: 'delete',
      converter: _http.asNull,
    );
  }

  Future executeWebhook(String webhookId, String webhookToken) {
    var endpoint = '/webhooks/$webhookId/$webhookToken';
    throw UnsupportedError('Execute Webhook not implemented'); // TODO impl
  }

  Future<Webhook> executeSlackCompatibleWebhook(
    String webhookId,
    String webhookToken, {
    bool? wait,
  }) {
    var endpoint = '/webhooks/$webhookId/$webhookToken/slack';
    return _http.request(
      endpoint,
      converter: Webhook.fromJson,
      method: 'post',
      query: {
        ...insertNotNull('wait', wait, str: true),
      },
    );
  }

  Future<Webhook> executeGithubCompatibleWebhook(
    String webhookId,
    String webhookToken, {
    bool? wait,
  }) {
    var endpoint = '/webhooks/$webhookId/$webhookToken/github';
    return _http.request(
      endpoint,
      converter: Webhook.fromJson,
      method: 'post',
      query: {
        ...insertNotNull('wait', wait, str: true),
      },
    );
  }

  Future<Message> editWebhookMessage(
    String webhookId, {
    required String webhookToken,
    required String messageId,
    String? content = '',
    List<Embed>? embeds = const [],
    AllowedMentions? allowedMentions,
  }) {
    var endpoint = '/webhooks/$webhookId/$webhookToken/messages/$messageId';
    return _http.request(
      endpoint,
      converter: Message.fromJson,
      method: 'patch',
      query: {
        ...insertNotDefault('content', content, ''),
        ...insertNotDefault('content', content, const []),
        // TODO user cannot pass null value in the request
        ...insertNotNull('allowed_mentions', allowedMentions),
      },
    );
  }

  Future deleteWebhookMessage(
    String webhookId, {
    required String webhookToken,
    required String messageId,
  }) {
    var endpoint = '/webhooks/$webhookId/$webhookToken/messages/$messageId';
    return _http.request(endpoint, method: 'delete', converter: _http.asNull);
  }
}
