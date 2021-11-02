import 'package:flutter/material.dart';

import 'faq_question.dart';
import 'faq_question_list.dart';



class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);
  @override
  createState() => _FaqState();
}

/* 
This Widget or Scaffold is used, to show the user the faq interface. Currently it utilizes the FaqQuestionList and the FaqQuestion and inserts their values into the ExpansionPanelList
*/
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
            for ( var i in  qList) FaqQuestion(question: i,key: ValueKey(i)).create()
          ],
        ),
      ),
    );
  }
}
