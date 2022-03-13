import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'faqquestion_panel.dart';

///This Widget is used, to show the user the faq interface.

class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FaqService().cacheQuestions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!(snapshot.data as bool)) {
          return Center(child: Text(AppLocalizations.of(context)!.faqErrorLoadingQuestions)); 
        }

        List<FaqQuestionTranslation> tList = FaqService().extractTranslations(language: UserService().language);

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
    );
  }
}
