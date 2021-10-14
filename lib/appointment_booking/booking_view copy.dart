import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  int _currentStep = 0;
  DateTime _selectedDay = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepTapped: (value) => setState(() {
          _currentStep = value;
        }),
        onStepCancel: () => setState(() {
          _currentStep--;
        }),
        controlsBuilder: (context, details) {
          //First step cannot go back
          if (_currentStep > -1) return Container();

          return Row(
            children: <Widget>[
              Expanded(child: Container()),
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text('Zurück'),
              ),
            ],
          );
        },
        steps: [
          Step(
            isActive: _currentStep == 0,
            title: _displayDay(),
            content: SizedBox(
              child: TableCalendar(
                firstDay: DateTime.utc(2021, 9, 01),
                lastDay: DateTime.utc(2021, 10, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _currentStep++;
                  });
                },
              ),
            ),
          ),
          Step(
            isActive: _currentStep == 1,
            title: _displayTime(),
            content: Container(
              color: Colors.amber,
              width: double.infinity,
              height: 300,
            ),
          ),
          Step(
            isActive: _currentStep == 2,
            title: Text("Angaben überprüfen"),
            content: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CupertinoFormSection(
                    margin: EdgeInsets.all(12),
                    children: [
                      CupertinoTextFormFieldRow(
                        placeholder: "Dein Name",
                      ),
                      CupertinoTextFormFieldRow(
                        placeholder: "Dein Geburtsdatum",
                      )
                    ],
                  ),
                ),
                CupertinoFormSection(
                  margin: EdgeInsets.all(12),
                  children: [
                    CupertinoTextFormFieldRow(
                      placeholder: "Dein Name",
                    ),
                    CupertinoTextFormFieldRow(
                      placeholder: "Dein Geburtsdatum",
                    )
                  ],
                ),
                SizedBox(height: 20),
                CupertinoButton.filled(
                  child: Text("Termin buchen"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayDay() {
    //_selectedDay.millisecondsSinceEpoch
    if (0 == 0) {
      return Text("");
    }

    return SizedBox(
      width: double.infinity,
      height: 80,
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
            Text(
              _selectedDay.day.toString() +
                  "." +
                  (_selectedDay.month.toString().length == 1
                      ? "0" + _selectedDay.month.toString()
                      : _selectedDay.month.toString()) +
                  "." +
                  _selectedDay.year.toString(),
              style: TextStyle(
                fontSize: 36,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _displayTime() {
    if (0 == 0) {
      return Text("");
    }

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        child: Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              size: 60,
              color: Colors.red[500],
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "08:30",
              style: TextStyle(
                fontSize: 36,
              ),
            )
          ],
        ),
      ),
    );
  }
}

final TextStyle headStyle = TextStyle(
  color: Colors.white70,
);

final TextStyle subStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);
