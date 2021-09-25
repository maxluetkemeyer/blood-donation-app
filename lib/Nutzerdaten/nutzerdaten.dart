import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ukmblutspende/Home/menu.dart';

class Nutzerdaten extends StatefulWidget {
  const Nutzerdaten({Key? key}) : super(key: key);

  @override
  _NutzerdatenState createState() => _NutzerdatenState();
}

class _NutzerdatenState extends State<Nutzerdaten> {
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

  Future<String> nDaten() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String vorname = prefs.getString("vorname") ?? "";
    String name = prefs.getString("name") ?? "";

    return vorname + " " + name;
  }

  final TextEditingController _firstNameController =
      new TextEditingController();

  @override
  void initState() {
    _firstNameController.text = "Dominik Eitner";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: nDaten(),
        builder: (context, snapshot) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: Menu(),
              appBar: AppBar(
                title: Text("Nutzerdaten"),
              ),
              body: SingleChildScrollView(
                  child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(" "),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: const Text("Ihre Nutzerdaten:",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 300,
                              height: 30,
                              child: Text("Name",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ]),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: 300,
                                height: 50,
                                child: TextField(
                                  controller: _firstNameController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Your Name'),
                                )),
                          ]),
                      const Text(" "),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 300,
                              height: 30,
                              child: const Text("Geburtsdatum",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ]),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
        });
  }
}

class Calendar extends StatelessWidget {
  List<Meeting> meetings = <Meeting>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String>(
            future: funktion(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> datenMap =
                    jsonDecode(snapshot.data ?? "abc");
                var datum = Datum.fromJson(datenMap);
                int l = datenMap["Datum"].length;
                for (var length = 0; length < l; length++) {
                  _setDataSource(
                      datenMap["Datum"][length]["Jahr"],
                      datenMap["Datum"][length]["Monat"],
                      datenMap["Datum"][length]["Tag"]);
                }
              }
              return SfCalendar(
                view: CalendarView.month,
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              );
            }));
  }

  List<Meeting> _getDataSource() {
    return meetings;
  }

  List<Meeting> _setDataSource(int j, int m, int d) {
    print(j + m + d);
    var mee = Meeting("Blutspende", DateTime.utc(j, m, d),
        DateTime.utc(j, m, d, 2), Color(0xFF0F8644), true);
    if (!(meetings.contains(mee))) {
      meetings.add(Meeting("Blutspende", DateTime.utc(j, m, d),
          DateTime.utc(j, m, d, 2), Color(0xFF0F8644), true));
    }
    return meetings;
  }

  Future<String> funktion() async {
    //asyncron json laden und zurückgeben
    return await rootBundle.loadString('assets/images/daten.json');
  }
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

class Datum {
  final int jahr;
  final int monat;
  final int tag;
  Datum(this.jahr, this.monat, this.tag);

  Datum.fromJson(Map<String, dynamic> json)
      : jahr = json["Jahr"],
        monat = json["Monat"],
        tag = json["Tag"];

  Map<String, dynamic> toJson() => {
        "Jahr": jahr,
        "Monat": monat,
        "Tag": tag,
      };
}
