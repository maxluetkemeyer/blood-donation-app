import 'dart:convert';

import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';

Future<bool> bookAppointment({required Appointment appointment}) async {
  print(appointment.toJson().toString());

  String path = "/appointment";
  String body = jsonEncode(appointment.toJson());

  final response = await BackendService().postRequest(path: path, body: body);

  if (response.statusCode != 201) {
    print("error getFaqQuestions");
    return false;
  }

  //Convert String to Map
  Map<String, dynamic> json = jsonDecode(response.body);

  //Convert Map to Appointment
  Appointment responseAppointment = Appointment.fromJson(json);

  //Update BookingService reference
  BookingService().bookedAppointment = responseAppointment;

  return true;
}
