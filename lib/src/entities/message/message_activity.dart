library entities;

import '../../../entities.dart';

class MessageActivity {
  final MessageActivityType type;
  final String? partyId;

  MessageActivity({
    required this.type,
    this.partyId,
  });

  static MessageActivity fromJson(Map<String, dynamic> json) {
    return MessageActivity(
      type: MessageActivityType.forValue(json['type']),
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
