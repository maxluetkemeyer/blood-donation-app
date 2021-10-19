import 'package:flutter/material.dart';

import 'package:ukmblooddonation/faq/faq_question.dart';
import 'package:ukmblooddonation/faq/faq_question_list.dart';
import 'package:ukmblooddonation/faq/faq_question_model.dart';

class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);
  @override
  createState() => _FaqState();
}

class _FaqState extends State<FaqView> {

  //list of all FAQ Questions
  final qList = FaqQuestionList().qList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 3,
          animationDuration: Duration(milliseconds: 600),
          children: [
            for ( var i in  qList) FaqQuestion(question: i).create()
          ],
        ),
      ),
    );
  }
}
