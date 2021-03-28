library entities;

class SessionStartLimit {
  final int total;
  final int remaining;
  final int resetAfter;
  final int maxConcurrency;

  SessionStartLimit({
    required this.total,
    required this.remaining,
    required this.resetAfter,
    required this.maxConcurrency,
  });

  static SessionStartLimit fromJson(Map<String, dynamic> json) {
    return SessionStartLimit(
      total: json['total'],
      remaining: json['remaining'],
      resetAfter: json['reset_after'],
      maxConcurrency: json['max_concurrency'],
    );
  }

  Map toJson() {
    return {
      'total': total,
      'remaining': remaining,
      'reset_after': resetAfter,
      'max_concurrency': maxConcurrency,
    };
  }
}
