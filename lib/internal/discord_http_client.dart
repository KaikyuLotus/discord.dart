import 'dart:convert';

import 'package:discord/internal/internal.dart';
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

  List<T> Function(Map<String, dynamic>) listMapper<T>(
    T Function(Map<String, dynamic>) mapper,
  ) {
    return (Map<String, dynamic> arrObj) => fromArray(mapper, arrObj['arr'])!;
  }

  Null asNull(dynamic json) => null;

  Future<T> request<T>(
    String endpoint, {
    required T Function(Map<String, dynamic>) converter,
    dynamic? body,
    Map<String, String?>? query,
    String method = 'get',
  }) async {
    var uri = Uri.parse('$_baseUrl$endpoint');
    if (query != null) {
      uri = uri.replace(queryParameters: query);
    }
    var headers = {
      'User-Agent': '$_name ($_name, $_version)',
      'Authorization': 'Bot $_token',
    };
    var request = Request(method.toUpperCase(), uri);
    if (body != null) {
      headers['Content-Type'] = 'application/json';
      var stringBody = json.encode(body);
      request.body = stringBody;
    }
    request.headers.addAll(headers);

    var response = await _client.send(request);

    if (response.statusCode == 204) {
      return Future.value(null);
    }

    // TODO handle all 2xx codes
    if (response.statusCode < 200 || response.statusCode >= 300) {
      // TODO specialized exception
      var responseString = await response.stream.bytesToString();
      throw Exception(responseString);
    }

    var responseString = await response.stream.bytesToString();
    var jsonData = json.decode(responseString);
    return converter(jsonData is List ? {'arr': jsonData} : jsonData);
  }
}
