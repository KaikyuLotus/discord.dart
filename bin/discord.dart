import 'dart:convert';
import 'dart:io';

import 'package:discord/discord.dart';

class MyBot extends DiscordClient {
  MyBot(String token) : super(token, intents: Intent.all);

  @override
  Future onReady(dynamic event) async {
    print('Ready!');
    var sent = await sendMessage('805087651450978337', {'content': 'bop!'});
    print('I (${sent.author.username}) sent "${sent.content}" to ${sent.channelId}');
  }

  @override
  Future onMessageCreate(Message message) async {
    print('New message from ${message.author.username}');
  }

  @override
  Future onEvent(String type, dynamic event) async {
    print('New event of type $type: ${json.encode(event)}');
  }
}

void main(List<String> arguments) async {
  var token = Platform.environment['BOT_TOKEN']!;

  var bot = MyBot(token);
  await bot.run();
}
