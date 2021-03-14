import 'package:discord/discord.dart';

extension DiscordAPIMethods on DiscordClient {
  // Guilds
  Future<Guild> getGuild(String guildId, {bool withCounts = false}) async {
    var endpoint = '/guilds/$guildId';
    return http.request(endpoint, converter: Guild.fromJson);
  }

  // Channels
  // TODO real message entity
  Future<Message> sendMessage(String channelId, Map<String, dynamic> message) {
    var endpoint = '/channels/$channelId/messages';
    return http.request(endpoint, converter: Message.fromJson, body: message);
  }

}
