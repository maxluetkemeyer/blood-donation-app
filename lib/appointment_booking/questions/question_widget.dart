import 'package:flutter/material.dart';

import 'question_model.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function nextQuestionFunc;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.nextQuestionFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.grey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text(
                question.text,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
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
                icon: const Icon(
                  Icons.done,
                ),
                label: const Text("Yes"),
                style: const ButtonStyle(),
              ),
            ),
            const SizedBox(
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
                label: const Text("No"),
                icon: const Icon(
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
