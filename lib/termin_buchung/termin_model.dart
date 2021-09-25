class Termin {
  final String id;
  final DateTime time;

  Termin({
    required this.id,
    required this.time,
  });

  factory Termin.fromJson(Map<String, dynamic> json) {
    return Termin(
      id: json['id'],
      time: json['time'],
    );
  }
}
