library entities;

class PartialInvite {
  final String? code;
  final int uses;

  PartialInvite({
    this.code,
    this.uses = 0,
  });

  static PartialInvite fromJson(Map<String, dynamic> json) {
    return PartialInvite(
      code: json['code'],
      uses: json['uses'],
    );
  }

  Map toJson() {
    return {
      'code': code,
      'uses': uses,
    };
  }
}
