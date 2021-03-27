library entities;

import '../../../entities.dart';
import '../../internal.dart';

class InteractionApplicationCommandCallbackData {
  final bool? tts;
  final String? content;
  final List<Embed>? embeds;
  final AllowedMentions? allowedMentions;
  final int? flags;

  InteractionApplicationCommandCallbackData({
    this.tts,
    this.content,
    this.embeds,
    this.allowedMentions,
    this.flags,
  });

  static InteractionApplicationCommandCallbackData fromJson(
    Map<String, dynamic> json,
  ) {
    return InteractionApplicationCommandCallbackData(
      tts: json['tts'],
      content: json['content'],
      embeds: fromArray(Embed.fromJson, json['embeds']),
      allowedMentions: ifNotNull(
        AllowedMentions.fromJson,
        json['allowed_mentions'],
      ),
      flags: json['flags'],
    );
  }

  Map toJson() {
    return {
      'tts': tts,
      'content': content,
      'embeds': embeds,
      'allowed_mentions': allowedMentions,
      'flags': flags,
    }..filterNullValues();
  }
}
