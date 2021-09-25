import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nutzerdaten extends StatelessWidget {
  /* setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('number', 1);
    int numbers = (prefs.getInt('number') ?? 2);
    print(numbers);
  }

  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int numbers = (prefs.getInt('number') ?? 2);
    print(numbers);
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Nutzerdaten"),
        ),
        body: SingleChildScrollView(
            child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
            const Text(" "),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: const Text("Ihre Nutzerdaten:",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                width: 300,
                height: 30,
                child: Text("Name",
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              ),
            ]),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Your Name'),
                  )),
            ]),
            const Text(" "),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                width: 300,
                height: 30,
                child: const Text("Geburtsdatum",
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              ),
            ]),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Your Birthday'),
                  )),
            ]), //Vorname aus json
            const Text(" "),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                  width: 300,
                  height: 50,
                  child: const Text("Ihre letzten Blutspenden",
                      style: TextStyle(fontSize: 16))),
            ]),
            /*
            SizedBox(
              child: TableCalendar(
                firstDay: DateTime.utc(2021, 9, 01),
                lastDay: DateTime.utc(2021, 10, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
              ),
            ),
            */
            SizedBox(height: 500, child: Calendar())
          ]),
        )));
  }
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      dataSource: MeetingDataSource(_getDataSource()),
      monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  meetings.add(Meeting("Blutspende", DateTime.utc(2021, 9, 17),
      DateTime.utc(2021, 9, 17, 2), Color(0xFF0F8644), true));
  meetings.add(Meeting("Blutspende", DateTime.utc(2021, 9, 18),
      DateTime.utc(2021, 9, 18, 2), Color(0xFF0F8644), false));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
