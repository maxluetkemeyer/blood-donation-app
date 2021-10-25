import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ukmblooddonation/services/user/user_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDataView extends StatefulWidget {
  const UserDataView({Key? key}) : super(key: key);

  @override
  _UserDataViewState createState() => _UserDataViewState();
}

class _UserDataViewState extends State<UserDataView> {
  late TextEditingController _birthdayController;
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch - 568036800000);

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
    _birthdayController.text = UserService.instance.birthdayAsString;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: 10,
                bottom: 40,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nutzerdaten",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
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
              header: Text("Letzter Blutspendetermin"),
              margin: EdgeInsets.all(12),
              children: [
                CupertinoFormRow(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2021, 9, 1),
                    lastDay: DateTime.now(),
                    focusedDay: DateTime.utc(2021, 9, 14),
                    calendarFormat: CalendarFormat.month,
                    currentDay: DateTime.utc(2021, 9, 14),
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
                      print("");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}