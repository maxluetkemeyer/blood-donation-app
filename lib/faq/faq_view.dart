import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:blooddonation/widgets/expandable_fab/expandable_fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';

import 'faqquestion_panel.dart';

///This Widget is used, to show the user the faq interface.
class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  String language = "de";

  @override
  Widget build(BuildContext context) {
    //List languages = FaqService().extractLanguages();
    List languages = [
      Language.fromIsoCode("de"),
      Language.fromIsoCode("en"),
    ];

    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 30,
        icon: const Icon(Icons.language),
        children: [
          //from top to bottom
          for (Language lan in languages)
            FloatingActionButton.extended(
              label: Text(lan.name),
              onPressed: () => setState(() {
                language = lan.isoCode;
              }),
            ),
        ],
      ),
      body: FutureBuilder(
        future: FaqService().cacheQuestions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!(snapshot.data as bool)) {
            return const Center(child: Text("Es ist ein Fehler aufgetreten beim Laden der FAQ Fragen."));
          }

          List<FaqQuestionTranslation> tList = FaqService().extractTranslations(language: language);

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
