library entities;

class RoleTags {
  final String? botId;
  final String? integrationId;

  // https://discord.com/developers/docs/topics/permissions#role-object-role-tags-structure
  // Discord docs refer to this field as "null" type
  // final null? premiumSubscriber;

  RoleTags({
    this.botId,
    this.integrationId,
  });

  static RoleTags fromJson(Map<String, dynamic> json) {
    return RoleTags(
      botId: json['bot_id'],
      integrationId: json['integration_id'],
    );
  }

  Map toJson() {
    return {
      'bot_id': botId,
      'integration_id': integrationId,
    };
  }
}
