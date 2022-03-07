import 'package:blooddonation/models/faqquestion_model.dart';
import 'package:blooddonation/models/faqquestiontranslation_model.dart';
import 'package:blooddonation/services/backend/requests/get_faq_questions.dart';
import 'package:language_picker/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blooddonation/misc/env.dart' as env;

export 'package:blooddonation/models/faqquestion_model.dart';
export 'package:blooddonation/models/faqquestiontranslation_model.dart';

class FaqService {
  //Singleton
  static final FaqService _instance = FaqService._private();
  factory FaqService() => _instance;
  FaqService._private() {
    print("Starting Faq Service");
    _init();
  }

  late SharedPreferences _prefs;
  DateTime _cacheTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<FaqQuestion> faqQuestions = [];
  List<FaqQuestionTranslation> faqQuestionTranslations = [];

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
    String dateString = _prefs.getString("faqQuestionsCache") ?? "";

    if (dateString.isNotEmpty) cacheTime = DateTime.parse(dateString);
  }

  Future<bool> cacheQuestions() async {
    // Regulary fetch data
    if (DateTime.now().difference(_cacheTime).inSeconds > env.FAQ_CACHE_DURATION.inSeconds) {
      return await getFaqQuestions();
    }

    // Are questions already downloaded?
    if (faqQuestions.isNotEmpty) return true;

    // Otherwise download Faq Questions
    return await getFaqQuestions();
  }

  List<FaqQuestionTranslation> extractTranslations({required String language}) {
    List<FaqQuestionTranslation> output = [];

    // Iterate through the questions and return the translation in correct order
    for (int position = 0; position < faqQuestions.length; position++) {
      // Find question
      FaqQuestion? question;
      for (FaqQuestion tmpQuestion in faqQuestions) {
        if (tmpQuestion.position == position) {
          question = tmpQuestion;
          break;
        }
      }

      // Find translation
      for (FaqQuestionTranslation translation in faqQuestionTranslations) {
        if (translation.faqQuestion == question!.id && translation.language == language) {
          output.add(translation);
          break;
        }
      }
    }
    return output;
  }

  List<Language> extractLanguages() {
    //Language myLanguage = Language.fromIsoCode("de");
    List<Language> languages = [];

    for (FaqQuestionTranslation translation in faqQuestionTranslations) {
      Language lan = Language.fromIsoCode(translation.language);

      bool found = false;
      for (Language oldLan in languages) {
        if (oldLan.isoCode == lan.isoCode) {
          found = true;
          break;
        }
      }

      if (!found) languages.add(lan);
    }

    return languages;
  }

  set cacheTime(DateTime dateTime) {
    _prefs.setString("faqQuestionsCache", dateTime.toString());

    _cacheTime = dateTime;
  }
}
