import '../services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  int _activeStep = 0;
  DateTime _selectedDay = DateTime.fromMillisecondsSinceEpoch(0);

  //String name = "";
  //DateTime bday = DateTime.fromMillisecondsSinceEpoch(0);

  late TextEditingController _birthdayController;

  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
  }

  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: IconStepper(
              direction: Axis.horizontal,
              enableNextPreviousButtons: false,
              activeStep: _activeStep,
              activeStepColor: Theme.of(context).primaryColor,
              activeStepBorderWidth: 6,
              stepRadius: 30,
              activeStepBorderPadding: 0,
              lineDotRadius: 1.4,
              lineLength: width * 0.2,
              icons: [
                Icon(
                  Icons.date_range_rounded,
                  color: Colors.white,
                  size: 3,
                ),
                Icon(Icons.access_time_filled, color: Colors.white),
                Icon(Icons.send, color: Colors.white),
              ],
              enableStepTapping: false,
            ),
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
        firstDay: DateTime.utc(2021, 10, 1),
        lastDay: DateTime.utc(2021, 11, 30),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
        weekendDays: [6, 7],
        calendarStyle: CalendarStyle(
          defaultDecoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          defaultTextStyle: TextStyle(
            fontSize: 20,
          ),
          weekendTextStyle: TextStyle(
            color: Colors.grey,
          ),
          outsideDaysVisible: false,
          todayDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
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
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _activeStep--;
        });

        return false;
      },
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            TerminBox(
              id: "0",
              uhrzeit: DateTime.utc(0, 0, 0, 8, 0),
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
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 8, 30),
                callback: () {}),
            TerminBox(
                id: "0", uhrzeit: DateTime.utc(0, 0, 0, 9, 0), callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 9, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 10, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 10, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 11, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 11, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 12, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 12, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 13, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 13, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 14, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 14, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 15, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 15, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 16, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 16, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 17, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 17, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 18, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 18, 30),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 19, 0),
                callback: () {}),
            TerminBox(
                id: "0",
                uhrzeit: DateTime.utc(0, 0, 0, 19, 30),
                callback: () {}),
          ],
        ),
      ),
    );
  }

  Widget _overview() {
    _birthdayController.text = UserService.instance.birthdayAsString;
    final DateTime earliestDonationBirthday =
        DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch - 568036800000);

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _activeStep--;
        });

        return false;
      },
      child: Column(
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
                  initialValue: UserService.instance.name,
                  onChanged: (value) => setState(() {
                    UserService.instance.name = value;
                  }),
                ),
              ),
              CupertinoFormRow(
                prefix: Text("Geburtsdatum"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Dein Geburtsdatum",
                  readOnly: true,
                  controller: _birthdayController,
                  onTap: () => showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => CupertinoActionSheet(
                      actions: [
                        SizedBox(
                          height: 220,
                          child: CupertinoDatePicker(
                            initialDateTime: earliestDonationBirthday,
                            maximumDate: earliestDonationBirthday,
                            mode: CupertinoDatePickerMode.date,
                            dateOrder: DatePickerDateOrder.dmy,
                            onDateTimeChanged: (DateTime dateTime) =>
                                UserService.instance.birthday = dateTime,
                          ),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text("Fertig"),
                        onPressed: () {
                          _birthdayController.text =
                              UserService.instance.birthdayAsString;

                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
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
                  initialValue:
                      DateFormat("dd.mm.yyyy 'um' hh:mm").format(_selectedDay),
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
                print("Termin buchen button pressed");
              },
            ),
          ),
        ],
      ),
    );
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
    double width = MediaQuery.of(context).size.width;
    return CupertinoButton.filled(
      padding: EdgeInsets.symmetric(horizontal: width * 0.09),
      onPressed: callback,
      child: Text(
        ((uhrzeit.hour.toString().length == 1)
                ? "0" + uhrzeit.hour.toString()
                : uhrzeit.hour.toString()) +
            ":" +
            ((uhrzeit.minute.toString().length == 1)
                ? "0" + uhrzeit.minute.toString()
                : uhrzeit.minute.toString()),
      ),
    );
  }
}
