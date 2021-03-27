import 'dart:io';

import 'package:discord/discord.dart';
import 'package:discord/entities.dart';

Future onReady(DiscordClient client, Ready event) async {
  print('Ready!');

  /*var options = [
    ApplicationCommandOption(
      type: ApplicationCommandOptionType.string,
      name: 'tags',
      description: 'Space separated tags',
      required: true,
    ),
    ApplicationCommandOption(
      type: ApplicationCommandOptionType.integer,
      name: 'count',
      description: 'How many images to get',
      required: false,
    ),
  ];

  await client.application.createSlashCommand(
    '820391972463575100',
    name: 'danbooru',
    description: 'Search images on danbooru',
    options: options,
    guildId: '805087651450978334',
  );*/
}

Future onInteractionCreate(
  DiscordClient client,
  Interaction interaction,
) async {
  print(interaction.data?.name);
  for (var option in interaction.data?.options ??
      <ApplicationCommandInteractionDataOption>[]) {
    print(option.name);
    print(option.value);
  }

  await client.interactions.callback(
    interaction.id,
    token: interaction.token,
    type: InteractionResponseType.deferredChannelMessageWithSource,
  );

  await Future.delayed(Duration(seconds: 3));

  await client.interactions.editResponse(
    '820391972463575100',
    token: interaction.token,
    data: InteractionApplicationCommandCallbackData(
      content: 'Done working!',
    )
  );

}

Future onMessageCreate(DiscordClient client, Message message) async {
  print('New message from ${message.author.username}');
}

void main(List<String> arguments) async {
  var token = Platform.environment['BOT_TOKEN']!;

  var client = DiscordClient(token, intents: Intent.all);

  client.onReady = onReady;
  client.onMessageCreate = onMessageCreate;
  client.onInteractionCreate = onInteractionCreate;

  await client.run();
}
