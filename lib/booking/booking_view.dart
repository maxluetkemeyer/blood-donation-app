import 'package:blooddonation/booking/status_views/booked_status/booked_status.dart';
import 'package:blooddonation/booking/status_views/default_status.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BookingService().bookedAppointment != null) {
      return const BookingBookedStatus();
    } else {
      return const BookingDefaultStatus();
    }
  }
}
