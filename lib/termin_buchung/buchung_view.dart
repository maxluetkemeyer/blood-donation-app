import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers.dart';

import '../Home/home.dart';
import '../termin_buchung/termin_model.dart';

class Buchung extends StatefulWidget {
  const Buchung({Key? key}) : super(key: key);

  @override
  _BuchungState createState() => _BuchungState();
}

StateProvider<ScrollController>? buchungsScrollController;

class _BuchungState extends State<Buchung> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    buchungsScrollController = StateProvider<ScrollController>((ref) {
      return scrollController;
    });
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buchung"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              child: TableCalendar(
                firstDay: DateTime.utc(2021, 9, 01),
                lastDay: DateTime.utc(2021, 10, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
                onDaySelected: (selectedDay, focusedDay) {
                  context.read(selectedDayProvider).state = selectedDay;
                  context.read(tappedDayProvider).state = true;
                },
              ),
            ),
            Consumer(
              builder: (context, watch, child) {
                final tappedDay = watch(tappedDayProvider).state;

                if (tappedDay) {
                  return FreieTermine();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FreieTermine extends StatefulWidget {
  @override
  _FreieTermineState createState() => _FreieTermineState();
}

class _FreieTermineState extends State<FreieTermine> {
  late Future<String> _response;

  Future<String> fetch() async {
    DateTime day = context.read(selectedDayProvider).state;

    String monat;
    if (day.month.toString().length == 1) {
      monat = "0" + day.month.toString();
    } else {
      monat = day.month.toString();
    }

    String tagString =
        day.day.toString() + monat + day.year.toString().substring(2, 4);

    print("tagString: " + tagString);
    final response = await http.get(Uri.parse(
        'http://ukm-mshack-env.eba-qaxzjmvp.eu-central-1.elasticbeanstalk.com/freieTermineProTag?datum=' +
            tagString));

    if (response.statusCode == 200) {
      //print(response.body);
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final selectedDay = watch(selectedDayProvider).state;

        _response = fetch();

        return Column(
          children: [
            SizedBox(
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
                          selectedDay.day.toString() +
                              "." +
                              (selectedDay.month.toString().length == 1
                                  ? "0" + selectedDay.month.toString()
                                  : selectedDay.month.toString()) +
                              "." +
                              selectedDay.year.toString(),
                          style: TextStyle(
                            fontSize: 36,
                          ),
                        ),
                        Text(
                          "Ausgewählter Blutspendetermin",
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
            ),
            Container(
              child: Text(
                "Freie Termine",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
            ),
            FutureBuilder<String>(
              future: _response,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //JSON String bearbeiten
                  Map<String, dynamic> map = jsonDecode(snapshot.data ?? "");

                  //print(map);

                  //print(map["day"]);
                  //print(map["freieUhrezeiten"]);

                  print(map["freieUhrezeiten"][0]);

                  int anzahlTermine = map["freieUhrezeiten"].length;

                  List<Widget> boxen = [];
                  for (int i = 0; i < anzahlTermine; i++) {
                    boxen.add(TerminBox(
                      uhrzeit: DateTime.fromMillisecondsSinceEpoch(
                          map["freieUhrezeiten"][i]["time"]),
                      id: map["freieUhrezeiten"][i]["id"].toString(),
                    ));
                  }
                  //boxen.add(Text(snapshot.data!));

                  return Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    children: boxen,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            Consumer(
              builder: (context, watch, child) {
                final myTermin = watch(selectedTerminProvider).state;

                if (myTermin.id.isEmpty) {
                  return Container();
                } else {
                  return DatenKarte();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class TerminBox extends StatelessWidget {
  final DateTime uhrzeit;
  final String id;

  const TerminBox({
    required this.uhrzeit,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xff93001D),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            uhrzeit.hour.toString() +
                ":" +
                ((uhrzeit.minute.toString().length == 1)
                    ? "0" + uhrzeit.minute.toString()
                    : uhrzeit.minute.toString()),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: () async {
        context.read(selectedTerminProvider).state =
            Termin(id: id, time: uhrzeit);

        ScrollController scon = context.read(buchungsScrollController!).state;

        sleep1(scon);
      },
    );
  }

  Future sleep1(ScrollController scon) {
    return new Future.delayed(const Duration(milliseconds: 40), () {
      scon.animateTo(
        scon.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
}

class DatenKarte extends ConsumerWidget {
  final TextStyle headStyle = TextStyle(
    color: Colors.white70,
  );

  final TextStyle subStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  Future<Map<String, String>> loadUserInfos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String vorname = prefs.getString("vorname") ?? "";
    final String name = prefs.getString("name") ?? "";
    final String bday = prefs.getString("bday") ?? "";

    return {"vorname": vorname, "name": name, "bday": bday};
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FutureBuilder<Map<String, String>>(
      future: loadUserInfos(),
      builder: (buildContext, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          Map<String, String> map = snapshot.data!;

          return Column(
            children: [
              Divider(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: Color(0xff003866),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Diese Daten werden übermittelt",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Name",
                          style: headStyle,
                        ),
                        Text(
                          (map["vorname"] ?? "") + " " + (map["name"] ?? ""),
                          style: subStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Geburtsdatum",
                          style: headStyle,
                        ),
                        Text(
                          map["bday"] ?? "",
                          style: subStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dein Termin",
                          style: headStyle,
                        ),
                        Text(
                          watch(selectedTerminProvider).state.time.toString(),
                          style: subStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 190,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      icon: Icon(Icons.close),
                      label: Text("Buchung abbrechen"),
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 190,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        AlertDialog(
                          title: Text('Dein Termin wurde gebaucht'),
                          content: Text('Wir freuen uns auf dich!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()),
                                );
                              },
                              child: Text('Fertig'),
                            ),
                          ],
                        );
                      },
                      child: Row(
                        children: [
                          Text("Termin buchen"),
                          Expanded(child: Container()),
                          Icon(Icons.send),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          );
        }
      },
    );
  }
}
