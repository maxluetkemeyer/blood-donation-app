import 'package:blooddonation/models/appointment_model.dart';

class BookingService {
  //Singleton
  static final BookingService _instance = BookingService._private();
  factory BookingService() => _instance;
  BookingService._private() {
    print("Starting Booking Service");
  }

  ///The variable saves the selected day during the booking process.
  DateTime? selectedDay;

  ///Saves the user selected appointment during the booking process.
  Appointment? selectedAppointment;

  ///List of Appointments that saves all Free Appointments.
  List<Appointment> freeAppointments = [];

  Appointment? bookedAppointment;

  ///Resets the BookingService.
  void resetBookingProcess() {
    selectedDay = null;
    freeAppointments = [];
  }
}
