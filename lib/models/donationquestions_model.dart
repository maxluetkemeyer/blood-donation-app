class DonationQuestion {
  int id;
  int position;
  bool isYesCorrect;

  DonationQuestion({
    required this.id,
    required this.position,
    required this.isYesCorrect,
  });

  ///Following the abstract factory pattern, an object of [DonationQuestion] can be created by using the [json] formatted Map.
  factory DonationQuestion.fromJson(Map<String, dynamic> json) => DonationQuestion(
        id: json["id"],
        position: json["position"],
        isYesCorrect: json["isYesCorrect"],
      );

  ///Returns the Object in the form of a Map in [Json] format.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "position": position,
      "isYesCorrect": isYesCorrect,
    };

    return map;
  }
}
