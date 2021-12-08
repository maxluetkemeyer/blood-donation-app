import 'package:blooddonation/models/appointment_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given the function toString when an appointment is created and the function is called, then the function returns the appointment in String-form',
      () {
    //ARRANGE
    Appointment testAppointment = Appointment(
      id: "1",
      start: DateTime.utc(1999, 10, 10),
      duration: const Duration(hours: 1),
    );
    //ACT
    var result = testAppointment.toString();
    //ASSERT
    expect(result, "Appointment 1 1999-10-10 00:00:00.000Z 1:00:00.000000");
  });

  
  test(
      'Given the function Appointment.fromJson when a Json with the identifier start, then the function returns an appointment with the data from the json as start value',
      () {
    //ARRANGE
    Map<String, dynamic> json = {'datetime': "1970-01-01 01:00:15.000"};
    //ACT
    Appointment testAppointment = Appointment.fromJson(json);
    //ASSERT

    expect(testAppointment.start, DateTime.fromMillisecondsSinceEpoch(15000));
  });
}
