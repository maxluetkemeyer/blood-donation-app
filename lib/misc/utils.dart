import 'package:intl/intl.dart';

DateTime getMonday(DateTime dateTime) => extractDay(dateTime).add(
      Duration(
        days: -(extractDay(dateTime).weekday - 1),
      ),
    );

DateTime extractDay(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

String dayWithTimeString(DateTime dateTime) {
  if (extractDay(dateTime) == extractDay(DateTime.now())) {
    return "Heute um ${DateFormat("HH:mm").format(dateTime)}";
  }

  return "${DateFormat("dd.MM.yyyy").format(dateTime)} um ${DateFormat("HH:mm").format(dateTime)}";
}

