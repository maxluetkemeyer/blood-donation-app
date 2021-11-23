import 'package:uuid/uuid.dart';

///Class to model the appointment, which is saved inside the [BookingServices]
class Appointment {
  String id;
  DateTime start;

  ///Constructor for the [Appointment] class
  Appointment({
    required this.id,
    required this.start,
  });

  ///Factory Constructor to generate an [Appointment] object out of a json map
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: const Uuid().v4(),
      start: DateTime.fromMillisecondsSinceEpoch(json['start']),
    );
  }

  ///Function to generate a String out of [id] and [start] from the [Appointment] class
  @override
  String toString() {
    return "Appointment " + id + " " + start.toString();
  }
}
