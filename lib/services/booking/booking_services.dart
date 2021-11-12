import 'dart:convert';

import 'package:http/http.dart' as http;

import 'appointment_model.dart';
import 'package:blooddonation/env.dart' as env;

class BookingService {
  static final BookingService instance = BookingService._privateConstructor();

  // For booking process
  late DateTime selectedDay;
  // Final choice in booking
  Appointment? selectedAppointment;
  // Appointment List to work with
  late List<Appointment> freeAppointments;

  BookingService._privateConstructor() {
    print("Starting Booking Service");
    _init();
  }

  void _init() {
    selectedDay = DateTime.fromMillisecondsSinceEpoch(0);
    freeAppointments = [];
  }

  void reset() {
    _init();
  }

  //bool wegmachen
  Future<bool> getFreeAppointments() async {
    final response =
        await http.get(Uri.parse(env.backendAdress + "/appointments"));

    if (response.statusCode == 200) {
      var appObjsJson = jsonDecode(response.body) as List;
      List<Appointment> appointments =
          appObjsJson.map((appJson) => Appointment.fromJson(appJson)).toList();

      freeAppointments = appointments;
      print(appointments);

      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
