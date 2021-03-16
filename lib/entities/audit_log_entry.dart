import 'package:discord/discord.dart';
import 'package:discord/entities/audit_log_entry_info.dart';
import 'package:discord/internal/internal.dart';

class AuditLogEntry {
  final String? targetId;
  final List<AuditLogChange>? changes;
  final String userId;
  final String id;
  final int actionType;
  final AuditEntryInfo? options;
  final String? reason;

  AuditLogEntry({
    this.targetId,
    this.changes,
    required this.userId,
    required this.id,
    required this.actionType,
    this.options,
    this.reason,
  });

  static AuditLogEntry fromJson(Map<String, dynamic> json) {
    return AuditLogEntry(
      targetId: json['target_id'],
      changes: fromArray(AuditLogChange.fromJson, json['changes']),
      userId: json['user_id'],
      id: json['id'],
      actionType: json['action_type'],
      options: ifNotNull(AuditEntryInfo.fromJson, json['options']),
      reason: json['reason'],
    );
  }

  Map toJson() {
    return {
      'target_id': targetId,
      'changes': changes,
      'user_id': userId,
      'id': id,
      'action_type': actionType,
      'options': options,
      'reason': reason,
    };
  }
}
