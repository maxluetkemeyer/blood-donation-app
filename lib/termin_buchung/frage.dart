import 'package:flutter/material.dart';

import 'frage_model.dart';

class FragenWidget extends StatelessWidget {
  Frage _frage;
  Function nextQuestionFunc;

  FragenWidget(this._frage, this.nextQuestionFunc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              _frage.text,
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
                if (_frage.isYesCorrect) {
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
                if (!_frage.isYesCorrect) {
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
    );
  }
}
