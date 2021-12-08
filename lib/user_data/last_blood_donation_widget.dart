import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

///Create a [TableCalendar] inside a [CupertinoFormSection] including the date, when the user last donated blood.
class LastBloodDonation extends StatelessWidget {
  const LastBloodDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: Text(AppLocalizations.of(context)!.userDataLastDonation),
      margin: const EdgeInsets.all(12),
      children: [
        CupertinoFormRow(
          child: TableCalendar(
            firstDay: DateTime.utc(2021, 9, 1),
            lastDay: DateTime.now(),
            focusedDay: DateTime.utc(2021, 9, 14),
            calendarFormat: CalendarFormat.month,
            currentDay: DateTime.utc(2021, 9, 14),
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
              print("");
            },
          ),
        ),
      ],
    );
  }
}
