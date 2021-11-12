import 'package:uuid/uuid.dart';

class Appointment {
  String id;
  DateTime start;

  Appointment({
    required this.id,
    required this.start,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: const Uuid().v4(),
      start: DateTime.fromMillisecondsSinceEpoch(json['start']),
    );
  }

  @override
  String toString() {
    return "Appointment " + id + " " + start.toString();
  }
}
