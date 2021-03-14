import 'package:discord/discord.dart';

extension DiscordAPIMethods on DiscordClient {
  // Channels

  Future<Message> sendMessage(
    String channelId,
    Map<String, dynamic> message,
  ) {
    return http.request(
      '/channels/$channelId/messages',
      message,
      Message.fromJson,
    );
  }
}
