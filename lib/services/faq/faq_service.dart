import 'package:blooddonation/models/faqquestion_model.dart';
import 'package:blooddonation/models/faqquestiontranslation_model.dart';

export 'package:blooddonation/models/faqquestion_model.dart';
export 'package:blooddonation/models/faqquestiontranslation_model.dart';

class FaqService {
  //Singleton
  static final FaqService _instance = FaqService._private();
  factory FaqService() => _instance;
  FaqService._private() {
    print("Starting Faq Service");
  }

  List<FaqQuestion> faqQuestions = [];
  List<FaqQuestionTranslation> faqQuestionTranslations = [];
}
