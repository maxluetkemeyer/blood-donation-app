import '../services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///The Stateful Widget for the User data screen
class UserDataView extends StatefulWidget {
  const UserDataView({Key? key}) : super(key: key);

  @override
  _UserDataViewState createState() => _UserDataViewState();
}

///The Stateless Widget for the User data screen
///
///The Birthday Input is accessed by [_birthdayController]
///
///[earliestDonationBirthday] is the earliest possible donor birthday to input into the
///bearthday selection
class _UserDataViewState extends State<UserDataView> {
  ///Is used to access either the already saved birthdate or to save a newly input birthdate
  late TextEditingController _birthdayController;

  ///Is the earliest possible donor birthday to input into the bearthday selection
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch - 568036800000);

  ///Function is called when [_UserDataViewState] is initialized
  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
  }

  ///Function is called when [_UserDataViewState] is disposed
  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  ///Build method for the User Data Screen
  @override
  Widget build(BuildContext context) {
    //the Controller for the birthday is set to the already input birthday.
    _birthdayController.text = UserService.instance.birthdayAsString;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 10,
                bottom: 40,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.userDataHeading,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            createInputUserData(),
            createLastBloodVisit(),
          ],
        ),
      ),
    );
  }

  ///Builder-Function to create a [CupertinoFormSection] where the user can input the name and birthday,
  ///if the user hasn't already input the data during the booking process. In case the user has already
  ///input the data before, the data can be seen inside the Input fields via [UserService].
  Widget createInputUserData() {
    return CupertinoFormSection.insetGrouped(
      header: Text(AppLocalizations.of(context)!.userDataDataHeading),
      footer: const Divider(),
      margin: const EdgeInsets.all(12),
      children: [
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.name),
          child: CupertinoTextFormFieldRow(
            placeholder: AppLocalizations.of(context)!.yourName,
            initialValue: UserService.instance.name,
            onChanged: (value) => setState(() {
              UserService.instance.name = value;
            }),
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.birthday),
          child: CupertinoTextFormFieldRow(
            placeholder: AppLocalizations.of(context)!.yourBirthday,
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
                  child: const Text("Fertig"),
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
    );
  }

  ///Builder-Function to create a [TableCalendar] inside a [CupertinoFormSection] including the date, when the user last
  ///donated blood.
  Widget createLastBloodVisit() {
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
