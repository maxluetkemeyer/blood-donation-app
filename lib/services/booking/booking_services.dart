import 'package:blooddonation/appointment_booking/booking/appointmentBox_widget.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers.dart';

class BookingService {
  static final BookingService instance = BookingService._privateConstructor();

  late DateTime selectedDay;

  BookingService._privateConstructor() {
    print("Starting Booking Service");
    _init();
  }

  void _init() {
    selectedDay = DateTime.fromMillisecondsSinceEpoch(0);
  }

  void reset() {
    _init();
  }

  List<Widget> appointmentBoxList(BuildContext context) {
    List<Widget> boxes = [];

    // just to showcase, remove it when online services get implemented
    for (int i = 0; i < 24; i++) {
      int hour = (i % 2 == 0) ? (i / 2).floor() + 8 : (i / 2).ceil() + 7;
      int minute = (i % 2 == 0) ? 0 : 30;

      AppointmentBox box = AppointmentBox(
        time: DateTime.utc(0, 0, 0, hour, minute),
        id: i.toString(),
        callback: () {
          DateTime selectedDay = BookingService.instance.selectedDay;
          BookingService.instance.selectedDay = selectedDay.add(
            Duration(
              hours: hour,
              minutes: minute,
            ),
          );

          print(BookingService.instance.selectedDay);
          context.read(bookingStateProvider).state++;
        },
      );

      boxes.add(box);
    }

    return boxes;
  }
}
