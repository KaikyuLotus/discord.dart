library entities;

class Timestamp {
  // TODO timestamps are strings?
  final int? start;
  final int? end;

  Timestamp({
    this.start,
    this.end,
  });

  static Timestamp fromJson(Map<String, dynamic> json) {
    return Timestamp(
      start: json['start'],
      end: json['end'],
    );
  }

  Map toJson() {
    return {
      'start': start,
      'end': end,
    };
  }
}
