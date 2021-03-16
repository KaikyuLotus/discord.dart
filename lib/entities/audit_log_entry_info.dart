class AuditEntryInfo {
  final String? deleteMemberDays;
  final String? membersRemoved;
  final String? channelId;
  final String? count;
  final String? id;
  final String? type;
  final String? roleName;

  AuditEntryInfo({
    this.deleteMemberDays,
    this.membersRemoved,
    this.channelId,
    this.count,
    this.id,
    this.type,
    this.roleName,
  });

  static AuditEntryInfo fromJson(Map<String, dynamic> json) {
    return AuditEntryInfo(
      deleteMemberDays: json['delete_member_days'],
      membersRemoved: json['members_removed'],
      channelId: json['channel_id'],
      count: json['count'],
      id: json['id'],
      type: json['type'],
      roleName: json['role_name'],
    );
  }

  Map toJson() {
    return {
      'delete_member_days': deleteMemberDays,
      'members_removed': membersRemoved,
      'channel_id': channelId,
      'count': count,
      'id': id,
      'type': type,
      'role_name': roleName,
    };
  }
}
