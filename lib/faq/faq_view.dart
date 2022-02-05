import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:flutter/material.dart';

import 'faqquestion_panel.dart';

///This Widget is used, to show the user the faq interface.
class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ExpansionPanelList.radio(
            elevation: 3,
            animationDuration: const Duration(milliseconds: 600),
            children: [
              for (FaqQuestion question in FaqService().faqQuestions) 
                FaqQuestionPanel(
                  question: question,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
