import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class AuditLogs {
  final List<Webhook> webhooks;
  final List<User> users;
  final List<AuditLogEntry> auditLogEntries;
  final List<Integration> integrations;

  AuditLogs({
    required this.webhooks,
    required this.users,
    required this.auditLogEntries,
    required this.integrations,
  });

  static AuditLogs fromJson(Map<String, dynamic> json) {
    return AuditLogs(
      webhooks: fromArray(Webhook.fromJson, json['webhooks'])!,
      users: fromArray(User.fromJson, json['users'])!,
      auditLogEntries: fromArray(
        AuditLogEntry.fromJson,
        json['audit_log_entries'],
      )!,
      integrations: fromArray(Integration.fromJson, json['integrations'])!,
    );
  }

  Map toJson() {
    return {
      'webhooks': webhooks,
      'users': users,
      'audit_log_entries': auditLogEntries,
      'integrations': integrations,
    };
  }
}
