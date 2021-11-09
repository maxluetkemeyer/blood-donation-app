import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class AppointmentBox extends StatelessWidget {
  final DateTime time;
  final String id;
  final VoidCallback callback;

  const AppointmentBox({
    Key? key,
    required this.time,
    required this.id,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CupertinoButton.filled(
      padding: EdgeInsets.symmetric(horizontal: width * 0.09),
      onPressed: () {
        callback();
        context.read(bookingStateProvider).state++;
      },
      child: Text(
        ((time.hour.toString().length == 1)
                ? "0" + time.hour.toString()
                : time.hour.toString()) +
            ":" +
            ((time.minute.toString().length == 1)
                ? "0" + time.minute.toString()
                : time.minute.toString()),
      ),
    );
  }
}
