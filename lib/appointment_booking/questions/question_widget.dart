import 'package:flutter/material.dart';

import 'question_model.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function nextQuestionFunc;

  QuestionWidget({required this.question, required this.nextQuestionFunc});

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  question.text,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff9d9d9d),
                ),
                color: Color(0xff9d9d9d),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
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
                key: ValueKey('noButton'),
                onPressed: () {
                  if (question.isYesCorrect) {
                    nextQuestionFunc();
                  }
                },
                icon: Icon(
                  Icons.done,
                ),
                label: Text("Yes"),
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
                key: ValueKey('noButton'),
                onPressed: () {
                  if (!question.isYesCorrect) {
                    nextQuestionFunc();
                  }
                },
                label: Text("No"),
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
