class Capacity {
  DateTime start;
  Duration duration;
  int slots;

  Capacity({
    required this.start,
    required this.duration,
    required this.slots,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) => Capacity(
        start: DateTime.parse(json["start"]),
        duration: Duration(minutes: json["duration"]),
        slots: json["slots"],
      );

  @override
  String toString() {
    return toJson().toString();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "start": start.toString(),
        "duration": duration.inMinutes,
        "slots": slots,
      };
}
