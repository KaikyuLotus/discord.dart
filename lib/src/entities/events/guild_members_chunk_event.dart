library entities;

import '../../../entities.dart';

class GuildMembersChunkEvent {
  final String guildId;
  final List<GuildMember> members;
  final int chunkIndex;
  final int chunkCount;
  final List<dynamic>? notFound;
  final List<PresenceUpdate>? presences;
  final String? nonce;

  GuildMembersChunkEvent({
    required this.guildId,
    required this.members,
    required this.chunkIndex,
    required this.chunkCount,
    this.notFound,
    this.presences,
    this.nonce,
  });

  static GuildMembersChunkEvent fromJson(Map<String, dynamic> json) {
    return GuildMembersChunkEvent(
      guildId: json['guild_id'],
      members: json['members'],
      chunkIndex: json['chunk_index'],
      chunkCount: json['chunk_count'],
      notFound: json['not_found'],
      presences: json['presences'],
      nonce: json['nonce'],
    );
  }

  Map toJson() {
    return {
      'guild_id': guildId,
      'members': members,
      'chunk_index': chunkIndex,
      'chunk_count': chunkCount,
      'not_found': notFound,
      'presences': presences,
      'nonce': nonce,
    };
  }
}
