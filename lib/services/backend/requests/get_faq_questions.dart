import 'dart:convert';

import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/faq/faq_service.dart';

Future<bool> getFaqQuestions() async {
  String path = "/faqquestions";

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode != 200) {
    print("error getFaqQuestions");
    return false;
  }

  //Convert String to Map
  Map<String, dynamic> json = jsonDecode(response.body);

  //Extract Lists of Maps 
  List<dynamic> faqQuestionMaps = json["faqQuestions"];
  List<dynamic> faqQuestionTranslationMaps = json["faqQuestionTranslations"];

  //Convert each List of Map to a List of a model
  List<FaqQuestion> faqQuestions = faqQuestionMaps.map((faqQuestionMap) => FaqQuestion.fromJson(faqQuestionMap)).toList();
  List<FaqQuestionTranslation> faqQuestionTranslaions =
      faqQuestionTranslationMaps.map((faqQuestionTranslationMap) => FaqQuestionTranslation.fromJson(faqQuestionTranslationMap)).toList();

  //Update FaqService references
  FaqService().faqQuestions = faqQuestions;
  FaqService().faqQuestionTranslations = faqQuestionTranslaions;
  FaqService().cacheTime = DateTime.now();

  return true;
}