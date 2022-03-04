import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Class to define the date choosing widget.
class ChooseDay extends ConsumerWidget {
  const ChooseDay({Key? key}) : super(key: key);

  ///Build method to build the Widget that allows the user to choose the desired date to donate.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableCalendar(
      locale: AppLocalizations.of(context)!.localeName,
      firstDay: DateTime.utc(2021, 10, 1),
      lastDay: DateTime.now().add(const Duration(days: 60)),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
      weekendDays: const [6, 7],
      calendarStyle: CalendarStyle(
        defaultDecoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: const TextStyle(
          fontSize: 20,
        ),
        weekendTextStyle: const TextStyle(
          color: Colors.grey,
        ),
        outsideDaysVisible: false,
        todayDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        todayTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (selectedDay, focusedDay) {
        //BookingService().selectedDay = selectedDay;
        BookingService().selectedAppointment = Appointment(
          id: -1,
          start: selectedDay,
          duration: const Duration(),
        );
        ref.read(bookingStateProvider.state).state++;
      },
    );
  }
}
