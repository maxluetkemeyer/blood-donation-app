import 'person_model.dart';
import 'request_model.dart';

class Appointment {
  int id;
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

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"] ?? -1,
        start: _removeTimeZone(DateTime.parse(json["start"])),
        duration: Duration(minutes: json["duration"]),
        request: json["request"] != null ? Request.fromJson(json["request"]) : null,
        person: json["person"] != null ? Person.fromJson(json["person"]) : null,
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "start": _removeTimeZone(start).toIso8601String(),
      "duration": duration.inMinutes,
    };

    if (id > 0) {
      map["id"] = id;
    }

    if (person != null) {
      map["person"] = person!.toJson();
    }

    if (request != null) {
      map["request"] = request!.toJson();
    }

    return map;
  }

  Appointment copyWith({
    int? id,
    DateTime? start,
    Duration? duration,
    Request? request,
    Person? person,
  }) {
    return Appointment(
      id: id ?? this.id,
      start: start ?? this.start,
      duration: duration ?? this.duration,
      request: request ?? this.request,
      person: person ?? this.person,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class EmptyAppointment extends Appointment {
  EmptyAppointment()
      : super(
          id: -1,
          start: DateTime(0),
          duration: const Duration(),
        );

  EmptyAppointment.free({
    required DateTime start,
    required Duration duration,
  }) : super(
          id: -1,
          start: start,
          duration: duration,
        );
}

DateTime _removeTimeZone(DateTime dateTime) {
  //TODO: Not pretty when send to Server
  //return dateTime.toLocal().subtract(dateTime.timeZoneOffset);
  return dateTime;
}
