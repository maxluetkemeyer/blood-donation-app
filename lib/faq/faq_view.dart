import 'package:flutter/material.dart';
import 'faq_question_widget.dart';
import '../models/faq_question_model.dart';
import 'faq_question_list.dart';

///This Widget is used, to show the user the faq interface.
class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  ///Build method to build the faq page, utilizing the [faqQuestionList] which is a list of [FaqQuestion]'s.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    final qList = faqQuestionList(context);

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ExpansionPanelList.radio(
            elevation: 3,
            animationDuration: const Duration(milliseconds: 600),
            children: [
              for (var i in qList)
                FaqQuestionWidget(
                  question: i,
                  key: ValueKey(i),
                ).create(),
            ],
          ),
        ],
      ),
    );
  }
}
