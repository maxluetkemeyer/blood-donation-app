import 'dart:convert';

import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';

Future<bool> cancelAppointment({required int appointmentId}) async {
  String path = "/appointment_cancel";
  String dateParam = genParam(key: "id", value: appointmentId.toString());
  path = "$path?$dateParam";

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode != 200) {
    print("error cancelAppointment");
    return false;
  }

  print("body ${response.body}");

  if (utf8.decode(response.bodyBytes) != '"successful"') {
    //TODO: Bug here are String literals inside the string
    print(response.body);
    return false;
  }

  //Clear BookingService reference
  BookingService().bookedAppointment = null;

  return true;
}
