class ActivitySecrets {
  final String? join;
  final String? spectate;
  final String? match;

  ActivitySecrets({
    this.join,
    this.spectate,
    this.match,
  });

  Map toJson() {
    return {
      'join': join,
      'spectate': spectate,
      'match': match,
    };
  }
}
