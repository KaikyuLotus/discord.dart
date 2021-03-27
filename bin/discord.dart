import 'dart:io';

import 'package:discord/discord.dart';
import 'package:discord/entities.dart';

Future onReady(DiscordClient client, Ready event) async {
  print('Ready!');
}

Future onMessageCreate(DiscordClient client, Message message) async {
  print('New message from ${message.author.username}');
}

Future onTypingEvent(DiscordClient client, TypingStartEvent event) async {
  print('${event.member?.user?.username} is typing');
}

Future onReactionAdd(
  DiscordClient client,
  MessageReactionAddEvent event,
) async {
  print('${event.member?.user?.username} add reaction ${event.emoji.name}');
}

Future onGuildRoleUpdate(
  DiscordClient client,
  GuildRoleUpdateEvent event,
) async {
  print('Role ${event.role.name} new position is ${event.role.position}');
}

void main(List<String> arguments) async {
  var token = Platform.environment['BOT_TOKEN']!;

  var client = DiscordClient(token, intents: Intent.all);

  client.onReady = onReady;
  client.onMessageCreate = onMessageCreate;
  client.onTypingStart = onTypingEvent;
  client.onMessageReactionAdd = onReactionAdd;
  client.onGuildRoleUpdate = onGuildRoleUpdate;

  await client.run();

  var members = await client.guilds.listGuildMembers(
    '805087651450978334',
    limit: 100,
  );
  for (var member in members) {
    print(member.user?.username);
  }
}
