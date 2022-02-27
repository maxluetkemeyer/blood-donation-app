class FaqQuestionTranslation {
  int id;
  String head;
  String body;
  String language;
  int faqQuestion;

  FaqQuestionTranslation({
    required this.id,
    required this.head,
    required this.body,
    required this.language,
    required this.faqQuestion,
  });

  factory FaqQuestionTranslation.fromJson(Map<String, dynamic> json) => FaqQuestionTranslation(
        id: json["id"],
        head: json["head"],
        body: json["body"],
        language: json["language"],
        faqQuestion: json["faqQuestion"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "head": head,
      "body": body,
      "language": language,
      "faqQuestion": faqQuestion,
    };

    return map;
  }
}
