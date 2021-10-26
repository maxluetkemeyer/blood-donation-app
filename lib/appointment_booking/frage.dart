import 'package:flutter/material.dart';

import 'frage_model.dart';

class FragenWidget extends StatelessWidget {
  final Frage frage;
  final Function nextQuestionFunc;

  FragenWidget({required this.frage, required this.nextQuestionFunc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Container(
              child: Text(
                frage.text,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (frage.isYesCorrect) {
                    nextQuestionFunc();
                  }
                },
                icon: Icon(
                  Icons.done,
                ),
                label: Text("Ja"),
                style: ButtonStyle(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (!frage.isYesCorrect) {
                    nextQuestionFunc();
                  }
                },
                label: Text("Nein"),
                icon: Icon(
                  Icons.close,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
