import 'dart:convert';

import 'package:http/http.dart';

class DiscordHTTPClient {
  static final _version = '0.0.1';

  static final _name = 'discord.dart';

  static final _apiVersion = '8';

  static final _baseUrl = 'https://discord.com/api/v$_apiVersion';

  final String _token;

  late Client _client;

  DiscordHTTPClient(this._token) {
    _client = Client();
  }

  Future<T> request<T>(
    String endpoint,
    Map<String, dynamic> body,
    T Function(Map<String, dynamic>) converter,
  ) async {
    var uri = Uri.parse('$_baseUrl$endpoint');
    var headers = {
      'User-Agent': '$_name ($_name, $_version)',
      'Authorization': 'Bot $_token',
    };
    var resp = await _client.post(uri, headers: headers, body: body);
    var jsonData = json.decode(resp.body);
    return converter(jsonData);
  }
}
