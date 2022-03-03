import 'package:blooddonation/booking/process/bookprocess_view.dart';
import 'package:blooddonation/booking/process/firstbooking_view.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';

class BookingDefaultStatus extends StatelessWidget {
  const BookingDefaultStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (UserService().birthdayAsString == "") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FirstBooking()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookProcessView()),
          );
        }
      },
      child: const SizedBox(
        height: double.infinity,
        child: Image(
          image: AssetImage("./assets/images/book_screen_design_mock.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
