class MessageActivity {
  // TODO enum https://discord.com/developers/docs/resources/channel#message-object-message-activity-types
  final int type;
  final String? partyId;

  MessageActivity({
    required this.type,
    this.partyId,
  });

  static MessageActivity fromJson(Map<String, dynamic> json) {
    return MessageActivity(
      type: json['type']!,
      partyId: json['party_id'],
    );
  }

  Map toJson() {
    return {
      'type': type,
      'party_id': partyId,
    };
  }
}
