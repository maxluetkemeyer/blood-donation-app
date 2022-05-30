import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///Widget that allows the user to choose the desired date to donate.
class ChooseDay extends ConsumerWidget {
  const ChooseDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableCalendar(
      locale: AppLocalizations.of(context)!.localeName,
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(const Duration(days: 180)),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 22,
        ),
        weekendStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 22,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      daysOfWeekHeight: 34,
      weekendDays: const [6, 7],
      calendarStyle: CalendarStyle(
        defaultDecoration: const BoxDecoration(
          color: Colors.white,
          //shape: BoxShape.circle,
        ),
        defaultTextStyle: TextStyle(
          fontSize: 20,
          color: Theme.of(context).primaryColor,
        ),
        weekendTextStyle: const TextStyle(color: Colors.grey),
        outsideDaysVisible: false,
        todayDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          //shape: BoxShape.circle,
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
