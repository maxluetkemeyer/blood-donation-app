import 'package:blooddonation/booking/process/bookprocess_view.dart';
import 'package:blooddonation/booking/process/firstbooking_view.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingDefaultStatus extends StatelessWidget {
  const BookingDefaultStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: const Color.fromARGB(255, 243, 203, 210),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 14,
              top: 22,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 26,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
            child: Text(
              "Spenden Sie Blut am UKM\n- in Münster für Münster.",
              style: TextStyle(
                fontSize: width * 0.07,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/booking.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                primaryColor: Colors.white,
              ),
              child: CupertinoButton.filled(
                pressedOpacity: 0.7,
                child: Text(
                  "Termin buchen",
                  style: TextStyle(
                    fontSize: width * 0.06,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () async {
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
              ),
            ),
          ),
          /*Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 45,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Text(
              "Termin buchen",
              style: TextStyle(
                fontSize: width * 0.06,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
