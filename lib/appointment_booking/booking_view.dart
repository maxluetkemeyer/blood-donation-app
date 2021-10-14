import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  int _activeStep = 0;
  DateTime _selectedDay = DateTime.fromMillisecondsSinceEpoch(0);

  String name = "";
  DateTime bday = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          IconStepper(
            direction: Axis.horizontal,
            enableNextPreviousButtons: false,
            alignment: Alignment.center,
            activeStep: _activeStep,
            activeStepColor: Theme.of(context).primaryColor,
            activeStepBorderWidth: 6,
            stepRadius: 30,
            activeStepBorderPadding: 0,
            lineDotRadius: 1.4,
            icons: [
              Icon(Icons.date_range_rounded, color: Colors.white),
              Icon(Icons.access_time_filled, color: Colors.white),
              Icon(Icons.send, color: Colors.white),
            ],
            enableStepTapping: false,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              bottom: 40,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _stepperHeader(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          _stepperBody(),
        ],
      ),
    );
  }

  String _stepperHeader() {
    switch (_activeStep) {
      case 0:
        return "Tag auswählen";
      case 1:
        return "Verfügbare Zeiten";
      case 2:
        return "Daten überprüfen";
      default:
        return "";
    }
  }

  Widget _stepperBody() {
    switch (_activeStep) {
      case 0:
        return _chooseDay();
      case 1:
        return _chooseTime();
      case 2:
        return _overview();
      default:
        return Text("");
    }
  }

  Widget _chooseDay() {
    return SizedBox(
      child: TableCalendar(
        firstDay: DateTime.utc(2021, 9, 01),
        lastDay: DateTime.utc(2021, 10, 31),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _activeStep++;
          });
        },
      ),
    );
  }

  Widget _chooseTime() {
    return Wrap(
      spacing: 24,
      runSpacing: 20,
      children: [
        TerminBox(
          id: "0",
          uhrzeit: DateTime.now(),
          callback: () => setState(() {
            _selectedDay = _selectedDay.add(
              Duration(
                hours: 8,
                minutes: 30,
              ),
            );
            _activeStep++;
          }),
        ),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
        TerminBox(id: "0", uhrzeit: DateTime.now(), callback: () {}),
      ],
    );
  }

  Widget _overview() {
    return FutureBuilder(
      future: _loadStoredUserData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return Column(
          children: [
            CupertinoFormSection.insetGrouped(
              header: Text("Deine Daten"),
              footer: Divider(),
              margin: EdgeInsets.all(12),
              children: [
                CupertinoFormRow(
                  prefix: Text("Name"),
                  child: CupertinoTextFormFieldRow(
                    placeholder: "Dein Name",
                    initialValue: snapshot.data.toString(),
                    onChanged: (value) => setState(() {
                      name = value;
                    }),
                  ),
                ),
                CupertinoFormRow(
                  prefix: Text("Geburtsdatum"),
                  child: CupertinoTextFormFieldRow(
                    readOnly: true,
                    onTap: () => showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: [
                          SizedBox(
                            height: 220,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              dateOrder: DatePickerDateOrder.dmy,
                              onDateTimeChanged: (DateTime dateTime) =>
                                  setState(() {
                                bday = dateTime;
                                print("Changed!");
                              }),
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text("Fertig"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    placeholder: "Dein Geburtsdatum",
                  ),
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              header: Text("Dein Termin"),
              margin: EdgeInsets.all(12),
              children: [
                CupertinoFormRow(
                  prefix: Text("Termin"),
                  child: CupertinoTextFormFieldRow(
                    placeholder: "Dein Termin",
                    initialValue: formatAppointment(_selectedDay),
                    readOnly: true,
                    onTap: () => showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text(
                          "Blutspendetermin",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        content: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "04.06.2023 um 14:30",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "ist dein ausgewählter Termin. Möchtest du deinen Termin ändern und die Buchung nochmal starten?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        actions: [
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () => setState(() {
                              //reset
                              _activeStep = 0;
                              _selectedDay =
                                  DateTime.fromMillisecondsSinceEpoch(0);
                              Navigator.pop(context);
                            }),
                            child: const Text('Termin ändern'),
                          ),
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Zurück'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: CupertinoButton.filled(
                child: Text("Termin buchen"),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("name", name);
                },
              ),
            ),
            TextButton(
              onPressed: () => showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text(
                    "Blutspendetermin",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  content: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "04.06.2023 um 14:30",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "ist dein ausgewählter Termin. Möchtest du deinen Termin ändern und die Buchung nochmal starten?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () => setState(() {
                        //reset
                        _activeStep = 0;
                        _selectedDay = DateTime.fromMillisecondsSinceEpoch(0);
                        //TODO: Reset to Home View
                        Navigator.pop(context);
                      }),
                      child: const Text('Buchung abbrechen'),
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Zurück'),
                    )
                  ],
                ),
              ),
              child: Text("Buchung abbrechen"),
            ),
          ],
        );
      },
    );
  }

  Future<String> _loadStoredUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString("name") ?? "";
    print("name " + name);

    return name;
  }

  String formatAppointment(DateTime dateTime) {
    String day = dateTime.day.toString();
    String month = dateTime.month.toString();
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString();
    String minute = dateTime.minute.toString();

    if (minute.length == 1) minute = "0$minute";
    if (hour.length == 1) hour = "0$hour";

    //return DateFormat("dd.mm.yyyy um hh:mm").format(dateTime);

    return "$day.$month.$year um $hour:$minute";
  }
}

class TerminBox extends StatelessWidget {
  final DateTime uhrzeit;
  final String id;
  final VoidCallback callback;

  const TerminBox({
    required this.uhrzeit,
    required this.id,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Color(0xff93001D),
        padding: EdgeInsets.only(
          bottom: 10,
          top: 10,
          left: 13,
          right: 13,
        ),
      ),
      onPressed: callback,
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
    );
  }
}
