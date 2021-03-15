import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class GuildsApi {
  final DiscordHTTPClient http;

  GuildsApi(this.http);

  Future<Guild> get(String guildId, {bool withCounts = false}) {
    var endpoint = '/guilds/$guildId';
    return http.request(endpoint, converter: Guild.fromJson);
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
    return http.request(
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

class ChannelApi {
  final DiscordHTTPClient http;

  ChannelApi(this.http);

  Future<Channel> get(String channelId) {
    var endpoint = '/channels/$channelId';
    return http.request(endpoint, converter: Channel.fromJson);
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
    return http.request(
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
    return http.request(
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
    return http.request(
      endpoint,
      converter: http.listMapper(Message.fromJson),
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
    return http.request(endpoint, converter: Message.fromJson);
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
    return http.request(
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
    return http.request(endpoint, converter: Message.fromJson, method: 'post');
  }

  Future createReaction(
    String channelId, {
    required String messageId,
    required String emoji,
  }) {
    var endp = '/channels/$channelId/messages/$messageId/reactions/$emoji/@me';
    return http.request(endp, converter: (j) => null, method: 'put');
  }

  Future deleteOwnReaction(
    String channelId, {
    required String messageId,
    required String emoji,
  }) {
    var endp = '/channels/$channelId/messages/$messageId/reactions/$emoji/@me';
    return http.request(endp, converter: (j) => null, method: 'delete');
  }

  Future deleteUserReaction(
    String channelId, {
    required String messageId,
    required String userId,
    required String emoji,
  }) {
    var endp = '/channels/$channelId/messages/'
        '$messageId/reactions/$emoji/$userId';
    return http.request(endp, converter: (j) => null, method: 'delete');
  }

  Future<List<User>> getReactions(
    String channelId, {
    required String messageId,
    required String emoji,
  }) {
    var endpoint = '/channels/$channelId/messages/$messageId/reactions/$emoji';
    return http.request(
      endpoint,
      converter: http.listMapper(User.fromJson),
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
    return http.request(endp, converter: (j) => null, method: 'delete');
  }


}
