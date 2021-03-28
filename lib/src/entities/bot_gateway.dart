library entities;

import '../../entities.dart';

class BotGateway {
  final String url;
  final int shards;
  final SessionStartLimit sessionStartLimit;

  BotGateway({
    required this.url,
    required this.shards,
    required this.sessionStartLimit,
  });

  static BotGateway fromJson(Map<String, dynamic> json) {
    return BotGateway(
      url: json['url'],
      shards: json['shards'],
      sessionStartLimit: SessionStartLimit.fromJson(
        json['session_start_limit'],
      ),
    );
  }

  Map toJson() {
    return {
      'url': url,
      'shards': shards,
      'session_start_limit': sessionStartLimit,
    };
  }
}
