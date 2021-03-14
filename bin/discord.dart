import 'package:discord/discord.dart';
import 'package:discord/internal/discord_http_client.dart';

void main(List<String> arguments) async {
  await DiscordClient.fromToken(
    '',
    intents: Intent.all,
  );
  final httpClient = DiscordHTTPClient();
  print(await httpClient.test());

}
