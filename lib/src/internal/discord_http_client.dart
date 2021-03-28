import 'dart:convert';

import 'package:http/http.dart';
import 'package:logging/logging.dart';

import '../internal.dart';

class DiscordHTTPClient {

  static final log = Logger('discord.dart');

  static final _version = '0.0.1';

  static final _name = 'discord.dart';

  // TODO merge with version in DiscordClient
  static final _apiVersion = '8';

  static final _baseUrl = 'https://discord.com/api/v$_apiVersion';

  final String _token;

  final Client _client;

  DiscordHTTPClient(this._token) : _client = Client();

  List<T> Function(Map<String, dynamic>) listMapper<T>(
    T Function(Map<String, dynamic>) mapper,
  ) {
    return (arrObj) => fromArray(mapper, arrObj['arr'])!;
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
    log.finer(() => 'Requesting to $uri');
    if (query != null) {
      log.finest(() => 'Using query parameters: $query');
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
      log.finest(() => 'Using body $stringBody');
      request.body = stringBody;
    }
    request.headers.addAll(headers);

    log.fine('Sending request...');
    var response = await _client.send(request);

    if (response.statusCode == 204) {
      log.fine('Discord responded with 204, returning null');
      return Future.value(null);
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      log.fine('Non 2xx response-code: ${response.statusCode}');
      var responseString = await response.stream.bytesToString();
      log.finer(() => 'Error response string: $responseString');
      // TODO specialized exception
      throw Exception(responseString);
    }

    var responseString = await response.stream.bytesToString();
    log.fine('Loading API response as json data');
    var jsonData = json.decode(responseString);
    log.fine('Calling converter and returning API result');
    return converter(jsonData is List ? {'arr': jsonData} : jsonData);
  }

  void close() => _client.close();

}
