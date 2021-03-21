library entities;

class ActivitySecrets {
  final String? join;
  final String? spectate;
  final String? match;

  ActivitySecrets({
    this.join,
    this.spectate,
    this.match,
  });

  static ActivitySecrets fromJson(Map<String, dynamic> json) {
    return ActivitySecrets(
      join: json['join'],
      spectate: json['spectate'],
      match: json['match'],
    );
  }

  Map toJson() {
    return {
      'join': join,
      'spectate': spectate,
      'match': match,
    };
  }
}
