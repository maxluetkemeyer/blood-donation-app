import 'dart:convert';

import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:intl/intl.dart';

Future<bool> getFreeAppointments(DateTime day) async {
  String path = "/appointments";
  String dateParam = genParam(key: "date", value: DateFormat("yyyy-MM-dd").format(day));
  path = path + "?" + dateParam;

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode != 200) {
    print("error getFreeAppointments");
    return false;
  }

  //Convert json String to List of dynamic (will be Maps)
  List<dynamic> json = jsonDecode(response.body) as List;

  //Convert the List to a List of Appointments
  List<Appointment> appointments = json.map((appointmentMap) => Appointment.fromJson(appointmentMap)).toList();

  //Update BookingService reference
  BookingService().freeAppointments = appointments;

  return true;
}
