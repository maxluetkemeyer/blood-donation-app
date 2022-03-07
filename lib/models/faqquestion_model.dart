class FaqQuestion {
  int id;
  int position;

  FaqQuestion({
    required this.id,
    required this.position,
  });

  ///Following the abstract factory pattern, an object of [FaqQuestion] can be created by using the [json] formatted Map.
  factory FaqQuestion.fromJson(Map<String, dynamic> json) => FaqQuestion(
        id: json["id"],
        position: json["position"],
      );

  ///Returns the Object in the form of a Map in [Json] format. 
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "position": position,
    };

    return map;
  }
}
