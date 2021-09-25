import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:table_calendar/table_calendar.dart';

// ignore: import_of_legacy_library_into_null_safe
import '../main.dart';

class Buchung extends StatefulWidget {
  const Buchung({Key? key}) : super(key: key);

  @override
  _BuchungState createState() => _BuchungState();
}

class _BuchungState extends State<Buchung> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buchung"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
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

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(day.toString()),
      ));
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
                              selectedDay.month.toString() +
                              "." +
                              selectedDay.year.toString(),
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
                  List<Widget> boxen = [];
                  for (int i = 0; i < 10; i++) {
                    boxen.add(TerminBox(
                      uhrzeit: DateTime.now(),
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
            )
          ],
        );
      },
    );
  }
}

class TerminBox extends StatelessWidget {
  final DateTime uhrzeit;

  const TerminBox({required this.uhrzeit});

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
            uhrzeit.hour.toString() + ":" + uhrzeit.minute.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class DatenKarte extends StatefulWidget {
  const DatenKarte({Key? key}) : super(key: key);

  @override
  _DatenKarteState createState() => _DatenKarteState();
}

class _DatenKarteState extends State<DatenKarte> {
  final TextStyle headStyle = TextStyle(
    color: Colors.white70,
  );

  final TextStyle subStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
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
                    "Armin Stein",
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
                    "18.07.1997",
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
                    "27.09.21 um 08:00",
                    style: subStyle,
                  ),
                ],
              ),
            ),
          ),
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
                onPressed: () {},
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
      ],
    );
  }
}
