import 'dart:io';

import 'package:lib_discord/discord.dart';
import 'package:lib_discord/entities.dart';
import 'package:logging/logging.dart';

void configureLogging() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((r) {
    stderr.writeln('[${r.level.name} ${r.time} ${r.loggerName}] ${r.message}');
    if (r.error != null)stderr.write('${r.error}');
    if (r.stackTrace != null) stderr.write('${r.stackTrace}');
  });
}

Future onReady(DiscordClient client, Ready event) async {
  print('Ready!');
}

Future onMessageCreate(DiscordClient client, Message message) async {
  print('New message from ${message.author.username}');
}

void main(List<String> arguments) async {
  configureLogging();

  var token = Platform.environment['BOT_TOKEN']!;

  var client = DiscordClient(token, intents: Intent.all);

  client.onReady = onReady;
  client.onMessageCreate = onMessageCreate;

  await client.run();
}
