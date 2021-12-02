///Class defines the model for all FAQ questions. It is utilized in [faqQuestionList] and therefore [FaqQuestionWidget.create()].
class FaqQuestion {
  final String id;
  final String question;
  final String answer;

  const FaqQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });
}
