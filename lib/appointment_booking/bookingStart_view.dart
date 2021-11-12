import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'questions/questions_view.dart';

class BookingStartView extends StatelessWidget {
  const BookingStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 60,
                bottom: 40,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Blutspendetermin",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: CupertinoButton.filled(
                child: Text("Termin buchen"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionsView()),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: width * 0.6,
              height: height * 0.3,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}