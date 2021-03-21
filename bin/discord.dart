import 'dart:io';

import 'package:discord/discord.dart';

Future onReady(DiscordClient client, dynamic event) async {
  print('Ready!');
}

Future onMessageCreate(DiscordClient client, Message message) async {
  print('New message from ${message.author.username}');
}

void main(List<String> arguments) async {

  var token = Platform.environment['BOT_TOKEN']!;

  var client = DiscordClient(token, intents: Intent.all);

  client.onReady = onReady;
  client.onMessageCreate = onMessageCreate;

  await client.run();

  var members = await client.guilds.listGuildMembers('805087651450978334', limit: 100);
  for (var member in members) {
    print(member.user?.username);
  }

}
