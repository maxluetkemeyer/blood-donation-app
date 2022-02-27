class FaqQuestion {
  int id;
  int position;

  FaqQuestion({
    required this.id,
    required this.position,
  });

  factory FaqQuestion.fromJson(Map<String, dynamic> json) => FaqQuestion(
        id: json["id"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "position": position,
    };

    return map;
  }
}
