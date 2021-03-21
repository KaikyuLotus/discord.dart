library entities;

class UnavailableGuild {
  final String id;
  final bool unavailable = true;

  UnavailableGuild(this.id);

  static UnavailableGuild fromJson(Map<String, dynamic> json) {
    return UnavailableGuild(json['id']);
  }

  Map toJson() => {'id': id};
}
