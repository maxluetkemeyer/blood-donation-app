import 'dart:convert';

import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:intl/intl.dart';

Future<bool> getFreeAppointments(DateTime day) async {
  String path = "/appointments";
  String dateParam = genParam(key: "date", value: DateFormat("yyyy-MM-dd").format(day));
  path = path + "?" + dateParam;

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode == 200) {
    var appObjsJson = jsonDecode(response.body) as List;

    List<Appointment> appointments = appObjsJson.map((appJson) => Appointment.fromJson(appJson)).toList();

    BookingService().freeAppointments = appointments;

    print(appointments);
    return true;
  } else {
    print("error getFreeAppointments");
    return false;
  }
}
