import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseDay extends StatelessWidget {
  const ChooseDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TableCalendar(
        firstDay: DateTime.utc(2021, 10, 1),
        lastDay: DateTime.utc(2021, 11, 30),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
        weekendDays: [6, 7],
        calendarStyle: CalendarStyle(
          defaultDecoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          defaultTextStyle: TextStyle(
            fontSize: 20,
          ),
          weekendTextStyle: TextStyle(
            color: Colors.grey,
          ),
          outsideDaysVisible: false,
          todayDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        onDaySelected: (selectedDay, focusedDay) {
          BookingService.instance.selectedDay = selectedDay;
          print(BookingService.instance.selectedDay);
          context.read(bookingStateProvider).state++;
        },
      ),
    );
  }
}
