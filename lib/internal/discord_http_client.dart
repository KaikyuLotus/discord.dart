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
    String endpoint, {
    required T Function(Map<String, dynamic>) converter,
    Map<String, dynamic>? body,
  }) async {
    var uri = Uri.parse('$_baseUrl$endpoint');
    var headers = {
      'User-Agent': '$_name ($_name, $_version)',
      'Authorization': 'Bot $_token',
    };
    var request = Request(body != null ? 'post' : 'get', uri);
    if (body != null) {
      headers['Content-Type'] = 'application/json';
      var stringBody = json.encode(body);
      request.body = stringBody;
    }
    request.headers.addAll(headers);

    var response = await _client.send(request);
    var responseString = await response.stream.bytesToString();
    // TODO handle all 2xx codes
    if (response.statusCode != 200) {
      // TODO specialized exception
      throw Exception(responseString);
    }
    var jsonData = json.decode(responseString);
    return converter(jsonData);
  }
}
