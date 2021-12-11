import 'dart:convert';

import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:http/http.dart' as http;
import 'package:blooddonation/misc/env.dart' as env;

class BackendService {
  static final BackendService instance = BackendService._privateConstructor();

  BackendService._privateConstructor() {
    print("Starting Booking Service");
  }

  Future<List<Appointment>> getFreeAppointments(DateTime day) async {
    final response = await http.get(
      Uri.parse(
        env.backendAdress + "/appointments?date=" + day.year.toString() + "-" + day.month.toString() + "-" + day.day.toString(),
      ),
    );

    if (response.statusCode == 200) {
      var appObjsJson = jsonDecode(response.body) as List;

      List<Appointment> appointments = appObjsJson.map((appJson) => Appointment.fromJson(appJson)).toList();

      //todo: set free appointments here or when future used?
      BookingService.instance.freeAppointments = appointments;
      return appointments;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load free appointments');
    }
  }

  Future<http.Response> bookAppointment(Appointment appointment) async {
    print(appointment.toJson().toString());

    final response = await http.post(
      Uri.parse(env.backendAdress + "/appointment"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(appointment.toJson()),
    );

    print(response.body);

    return response;
  }
}
