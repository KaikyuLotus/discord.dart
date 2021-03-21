library entities;

class ConnectionProperties {
  final String os;
  final String browser;
  final String device;

  const ConnectionProperties({
    this.os = 'Dart',
    this.browser = 'Unspecified',
    this.device = 'Unspecified',
  });

  Map toJson() {
    return {
      'os': '\$$os',
      'browser': '\$$browser',
      'device': '\$$device',
    };
  }
}
