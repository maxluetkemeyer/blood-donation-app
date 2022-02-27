class DonationQuestionTranslation {
  int id;
  String body;
  String language;
  int donationQuestion;

  DonationQuestionTranslation({
    required this.id,
    required this.body,
    required this.language,
    required this.donationQuestion,
  });

  factory DonationQuestionTranslation.fromJson(Map<String, dynamic> json) => DonationQuestionTranslation(
        id: json["id"],
        body: json["body"],
        language: json["language"],
        donationQuestion: json["donationQuestion"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "body": body,
      "language": language,
      "donationQuestion": donationQuestion,
    };

    return map;
  }
}
