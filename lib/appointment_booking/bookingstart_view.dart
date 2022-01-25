import 'package:blooddonation/appointment_booking/booking/booking_view.dart';
import 'package:blooddonation/appointment_booking/booking_appointment_booked.dart';
import 'package:blooddonation/appointment_booking/firstbooking_view.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';

class BookingStartView extends StatelessWidget {
  const BookingStartView({Key? key}) : super(key: key);

  ///Build method to build the booking page. Here, the user can access the booking process.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    return BookingService().bookedAppointment != null
        ? const AppointmentBookedView()
        : GestureDetector(
            onTap: () async {
              if (UserService().birthdayAsString == "") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstBooking()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookingView()),
                );
              }
            },
            child: const SizedBox(
              height: double.infinity,
              child: Image(
                image: AssetImage("./assets/images/book_screen_design_mock.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          );
  }
}
