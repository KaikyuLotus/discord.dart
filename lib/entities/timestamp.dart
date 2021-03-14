class Timestamp {
  final int? start;
  final int? end;

  Timestamp({
    this.start,
    this.end,
  });

  Map toJson() {
    return {
      'start': start,
      'end': end,
    };
  }
}
