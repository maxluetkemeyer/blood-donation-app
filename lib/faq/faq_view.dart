import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:flutter/material.dart';

import 'faqquestion_panel.dart';

///This Widget is used, to show the user the faq interface.
class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FaqService().cacheQuestions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<FaqQuestionTranslation> tList = FaqService().extractTranslations(locale: "de_DE");
          
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ExpansionPanelList.radio(
                elevation: 3,
                animationDuration: const Duration(milliseconds: 600),
                children: [
                  for (FaqQuestionTranslation translation in tList)
                    FaqQuestionPanel(
                      translation: translation,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
