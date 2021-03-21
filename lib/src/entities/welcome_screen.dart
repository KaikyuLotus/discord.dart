library entities;

import '../../entities.dart';
import '../internal.dart';

class WelcomeScreen {
  final String? description;
  final List<WelcomeScreenChannel> welcomeChannels;

  WelcomeScreen({
    this.description,
    required this.welcomeChannels,
  });

  static WelcomeScreen fromJson(Map<String, dynamic> json) {
    return WelcomeScreen(
      description: json['description'],
      welcomeChannels: fromArray(
        WelcomeScreenChannel.fromJson,
        json['welcome_channels'],
      )!,
    );
  }

  Map toJson() {
    return {
      'description': description,
      'welcome_channels': welcomeChannels,
    };
  }
}
