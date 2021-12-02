import 'person_model.dart';
import 'request_model.dart';

class Appointment {
  String id;
  DateTime start;
  Duration duration;
  Request? request;
  Person? person;

  Appointment({
    required this.id,
    required this.start,
    required this.duration,
    this.request,
    this.person,
  });

  ///Factory Constructor to generate an [Appointment] object out of a json map
  factory Appointment.fromJson(Map<String, dynamic> json) {
    print(json);
    return Appointment(
      id: json["id"] ?? "",
      //start: DateTime.parse(json['start']),
      start: DateTime.fromMillisecondsSinceEpoch(json["start"]),
      duration: Duration(
        hours: json["duration"] ?? 1,
      ),
      request: json["request"],
      person: json["person"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic>? personMap;
    Map<String, dynamic>? requestMap;

    if (person != null) {
      personMap = {
        "name": person!.name,
        "birthday": person!.birthday?.toIso8601String(),
        "gender": person!.gender,
      };
    }

    if (request != null) {
      requestMap = {
        "created": request!.created.toIso8601String(),
        "status": request!.status,
      };
    }

    Map<String, dynamic> map = {
      "id": id,
      "start": start.toIso8601String(),
      "duration": duration.toString(),
      "person": personMap,
      "request": requestMap,
    };

    return map;
  }

  @override
  String toString() {
    return "Appointment " + id + " " + start.toString() + " " + duration.toString();
  }
}

class EmptyAppointment extends Appointment {
  EmptyAppointment()
      : super(
          id: "-1",
          start: DateTime(0),
          duration: const Duration(),
        );
}
