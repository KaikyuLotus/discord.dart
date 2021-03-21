library entities;

class ChannelMention {
  final String id;
  final String guildId;

  // TODO enum from https://discord.com/developers/docs/resources/channel#channel-object-channel-types
  final int type;
  final String name;

  ChannelMention({
    required this.id,
    required this.guildId,
    required this.type,
    required this.name,
  });

  static ChannelMention fromJson(Map<String, dynamic> json) {
    return ChannelMention(
      id: json['id'],
      guildId: json['guild_id'],
      type: json['type'],
      name: json['name'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'guild_id': guildId,
      'type': type,
      'name': name,
    };
  }
}
