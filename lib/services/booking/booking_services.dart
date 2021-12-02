import 'package:blooddonation/models/appointment_model.dart';

class BookingService {
  ///A static instance of the [BookingService].
  static final BookingService instance = BookingService._privateConstructor();

  ///The variable saves the selected day during the booking process.
  DateTime? selectedDay;

  ///Saves the user selected appointment during the booking process.
  Appointment? selectedAppointment;

  ///List of Appointments that saves all Free Appointments.
  List<Appointment> freeAppointments = [];

  Appointment? bookedAppointment;

  ///The private Constructor that is called to when calling BookingService.instance.
  BookingService._privateConstructor() {
    print("Starting Booking Service");
  }

  ///Resets the BookingService.
  void resetBookingProcess() {
    selectedDay = null;
    freeAppointments = [];
  }
}


///Function to set the [freeAppointments].
///
///To access the data stored in the backend, a HTTP GET request is called.
///
///If the connection was successful, the fetched data is stored inside [freeAppointments].
///An [Exception] is thrown, if the server response does not match the expected response.
///
///returns [Future] specifically [void]