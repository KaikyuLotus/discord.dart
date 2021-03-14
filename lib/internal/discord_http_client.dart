import 'dart:convert';

import 'package:http/http.dart';

class DiscordHTTPClient {
  late Client _client;

  DiscordHTTPClient() {
    _client = Client();
  }

  Future test() async {
    var resp = await _client.post(
      Uri.parse(
        'https://discord.com/api/v8/channels/805087651450978337/messages',
      ),
      headers: {
        'User-Agent': 'DiscordBot (test, 1)',
        'Authorization':
            'Bot ',
      },
      body: {
        'content': 'Hellowo'
      },
    );
    return json.decode(resp.body);
  }
}
