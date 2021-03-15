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

  var messages = await client.channel.getMessages(
    '805087651450978337',
    limit: 1,
  );
  print(messages.length);

  var message = messages[0];

  var users = await client.channel.getReactions(
    message.channelId,
    messageId: message.id,
    emoji: '❤',
  );
  print(users.first.username);
}
