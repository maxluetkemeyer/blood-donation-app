import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class Buchung extends StatefulWidget {
  const Buchung({Key? key}) : super(key: key);

  @override
  _BuchungState createState() => _BuchungState();
}

class _BuchungState extends State<Buchung> {
  bool tappedDay = false;
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buchung"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            child: TableCalendar(
              firstDay: DateTime.utc(2021, 9, 01),
              lastDay: DateTime.utc(2021, 10, 31),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  tappedDay = true;
                });
              },
            ),
          ),
          tappedDay
              ? SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Card(
                    child: Row(
                      children: [
                        Icon(
                          Icons.bloodtype,
                          size: 60,
                          color: Colors.red[500],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDay.day.toString() +
                                  "." +
                                  _selectedDay.month.toString() +
                                  "." +
                                  _selectedDay.year.toString(),
                              style: TextStyle(
                                fontSize: 36,
                              ),
                            ),
                            Text(
                              "Auswegählter Blutspendetermin",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
