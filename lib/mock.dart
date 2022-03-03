import 'package:blooddonation/services/faq/faq_service.dart';

Future<bool> mockFaq() async {
  List<FaqQuestion> qList = [];
  List<FaqQuestionTranslation> tList = [];

  for (int i = 0; i < 10; i++) {
    int qId = DateTime.now().millisecondsSinceEpoch;
    await Future.delayed(const Duration(microseconds: 1000));
    int tId = DateTime.now().millisecondsSinceEpoch;

    FaqQuestion q = FaqQuestion(
      id: qId,
      position: i,
    );
    FaqQuestionTranslation t = FaqQuestionTranslation(
      id: tId,
      head: "head " + tId.toString(),
      body: "body " + tId.toString() + " qId " + qId.toString() + " ☕",
      language: "de_DE",
      faqQuestion: qId,
    );

    qList.add(q);
    tList.add(t);
    await Future.delayed(const Duration(microseconds: 1000));
  }

  qList.shuffle();
  tList.shuffle();

  FaqService().faqQuestions = qList;
  FaqService().faqQuestionTranslations = tList;
  FaqService().cacheTime = DateTime.now();

  await Future.delayed(const Duration(seconds: 1));

  return true;
}
