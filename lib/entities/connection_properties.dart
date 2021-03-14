class ConnectionProperties {
  final String os;
  final String browser;
  final String device;

  ConnectionProperties({
    required this.os,
    required this.browser,
    required this.device,
  });

  Map toJson() {
    return {
      'os': '\$$os',
      'browser': '\$$browser',
      'device': '\$$device',
    };
  }
}
