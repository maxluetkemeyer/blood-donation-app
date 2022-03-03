import 'dart:convert';

import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/services/backend/backend_service.dart';

Future<String> bookAppointment(Appointment appointment) async {
  print(appointment.toJson().toString());

  String path = "/appointment";
  String body = json.encode(appointment.toJson());

  final response = await BackendService().postRequest(path: path, body: body);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load free appointments');
  }
}
