import 'dart:convert';

import 'package:http/http.dart' as http;

import 'appointment_model.dart';
import 'package:blooddonation/env.dart' as env;

class BookingService {
  ///A static instance of the [BookingService].
  static final BookingService instance = BookingService._privateConstructor();

  ///The variable saves the selected day during the booking process.
  late DateTime selectedDay;

  ///Saves the user selected appointment during the booking process.
  Appointment? selectedAppointment;

  ///List of Appointments that saves all Free Appointments.
  late List<Appointment> freeAppointments;

  ///The private Constructor that is called to when calling BookingService.instance.
  BookingService._privateConstructor() {
    print("Starting Booking Service");
    _init();
  }

  ///Initializes BookingService by initializing [selectedDay] and [freeAppointments].
  void _init() {
    selectedDay = DateTime.fromMillisecondsSinceEpoch(0);
    freeAppointments = [];
  }

  ///Resets the BookingService by calling [_init].
  void reset() {
    _init();
  }

  ///Function to set the [freeAppointments].
  ///
  ///To access the data stored in the backend, a HTTP GET request is called.
  ///
  ///If the connection was successful, the fetched data is stored inside [freeAppointments].
  ///An [Exception] is thrown, if the server response does not match the expected response.
  ///
  ///returns [Future] specifically [void]
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
