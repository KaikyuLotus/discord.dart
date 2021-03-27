library entities;

import '../../../entities.dart';
import '../../internal.dart';

class InteractionResponse {
  final InteractionResponseType type;
  final InteractionApplicationCommandCallbackData? data;

  InteractionResponse({
    required this.type,
    this.data,
  });

  static InteractionResponse fromJson(Map<String, dynamic> json) {
    return InteractionResponse(
      type: InteractionResponseType.forValue(json['type']),
      data: ifNotNull(
        InteractionApplicationCommandCallbackData.fromJson,
        json['data'],
      ),
    );
  }

  Map toJson() {
    return {
      'type': type,
      'data': data,
    }..filterNullValues();
  }
}
