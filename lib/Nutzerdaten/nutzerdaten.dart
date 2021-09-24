import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Nutzerdaten extends StatelessWidget {
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
                child: const Text("Name",
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

            SizedBox(
              child: TableCalendar(
                firstDay: DateTime.utc(2021, 9, 01),
                lastDay: DateTime.utc(2021, 10, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
              ),
            ),
          ]),
        )));
  }
}
