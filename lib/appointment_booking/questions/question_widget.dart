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
              child: Text(
                question.text,
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
