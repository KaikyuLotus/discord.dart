import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class GuildsAPI {
  final DiscordHTTPClient _http;

  GuildsAPI(this._http);

  Future<Guild> get(String guildId, {bool withCounts = false}) {
    var endpoint = '/guilds/$guildId';
    return _http.request(endpoint, converter: Guild.fromJson);
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
}

class AuditLogAPI {
  final DiscordHTTPClient _http;

  AuditLogAPI(this._http);

  Future<AuditLogs> getGuildAuditLog(String guildId) {
    var endpoint = '/guilds/$guildId/audit-logs';
    return _http.request(endpoint, converter: AuditLogs.fromJson);
  }
}

class ChannelAPI {
  final DiscordHTTPClient _http;

  ChannelAPI(this._http);

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
        'limit': '$limit',
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

  EmojiAPI(this._http);

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
