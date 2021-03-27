library entities;

import '../../../entities.dart';
import '../../internal.dart';

class GuildEmojiUpdateEvent {
  final String guildId;
  final List<Emoji> emojis;

  GuildEmojiUpdateEvent({
    required this.guildId,
    required this.emojis,
  });

  static GuildEmojiUpdateEvent fromJson(Map<String, dynamic> json) {
    return GuildEmojiUpdateEvent(
      guildId: json['guild_id'],
      emojis: fromArray(Emoji.fromJson, json['emojis'])!,
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'emojis': emojis,
    };
  }
}
