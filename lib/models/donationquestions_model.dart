class DonationQuestion {
  int id;
  int position;
  bool isYesCorrect;

  DonationQuestion({
    required this.id,
    required this.position,
    required this.isYesCorrect,
  });

  factory DonationQuestion.fromJson(Map<String, dynamic> json) => DonationQuestion(
        id: json["id"],
        position: json["position"],
        isYesCorrect: json["isYesCorrect"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "position": position,
      "isYesCorrect": isYesCorrect,
    };

    return map;
  }
}
