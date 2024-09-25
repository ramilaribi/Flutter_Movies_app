class Schedule {
  final String? time;
  final List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] as String?,
      days: List<String>.from(json['days'] ?? []),
    );
  }
}
