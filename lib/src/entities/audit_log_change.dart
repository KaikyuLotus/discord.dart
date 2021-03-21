library entities;

class AuditLogChange {
  final dynamic? newValue;
  final dynamic? oldValue;
  final String key;

  AuditLogChange({
    required this.newValue,
    required this.oldValue,
    required this.key,
  });

  static AuditLogChange fromJson(Map<String, dynamic> json) {
    return AuditLogChange(
      key: json['key'],
      newValue: json['new_value'],
      oldValue: json['old_value'],
    );
  }

  Map toJson() {
    return {
      'key': key,
      'new_value': newValue,
      'old_value': oldValue,
    };
  }
}
