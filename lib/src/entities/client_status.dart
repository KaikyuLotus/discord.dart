library entities;

class ClientStatus {
  final String? desktop;
  final String? mobile;
  final String? web;

  ClientStatus({
    this.desktop,
    this.mobile,
    this.web,
  });

  static ClientStatus fromJson(Map<String, dynamic> json) {
    return ClientStatus(
      desktop: json['desktop'],
      mobile: json['mobile'],
      web: json['web'],
    );
  }

  Map toJson() {
    return {
      'desktop': desktop,
      'mobile': mobile,
      'web': web,
    };
  }
}
