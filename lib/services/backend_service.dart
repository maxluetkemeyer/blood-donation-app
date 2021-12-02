import 'dart:convert';

import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:http/http.dart' as http;
import 'package:blooddonation/env.dart' as env;

class BackendService {
  static final BackendService instance = BackendService._privateConstructor();

  BackendService._privateConstructor() {
    print("Starting Booking Service");
  }

  Future<List<Appointment>> getFreeAppointments() async {
    final response = await http.get(Uri.parse(env.backendAdress + "/appointments"));

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
    print(appointment.toJson());

    final response = await http.post(
      Uri.parse(env.backendAdress + "/appointment"),
      body: appointment.toJson().toString(),
    );

    return response;
  }
}
