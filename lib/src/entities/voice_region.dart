library entities;

class VoiceRegion {
  final String id;
  final String name;
  final bool vip;
  final bool optimal;
  final bool deprecated;
  final bool custom;

  VoiceRegion({
    required this.id,
    required this.name,
    required this.vip,
    required this.optimal,
    required this.deprecated,
    required this.custom,
  });

  static VoiceRegion fromJson(Map<String, dynamic> json) {
    return VoiceRegion(
      id: json['id'],
      name: json['name'],
      vip: json['vip'],
      optimal: json['optimal'],
      deprecated: json['deprecated'],
      custom: json['custom'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'vip': vip,
      'optimal': optimal,
      'deprecated': deprecated,
      'custom': custom,
    };
  }
}
