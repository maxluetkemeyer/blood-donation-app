import 'package:intl/intl.dart';

class Person {
  int id;
  String? name;
  DateTime? birthday;
  String? gender;
  bool firstDonation;
  String? telephoneNumber;

  Person({
    this.id = -1,
    this.name,
    this.birthday,
    this.gender,
    this.firstDonation = true,
    this.telephoneNumber,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        birthday: DateTime.tryParse(json["birthday"] ?? ""),
        gender: json["gender"],
        firstDonation: json["firstDonation"],
        telephoneNumber: json["telephoneNumber"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name ?? "",
      "gender": gender ?? "",
      "firstDonation": firstDonation,
      "telephoneNumber": "",
    };

    if (id < 0) {
      map["id"] = id;
    }

    if (birthday != null) {
      map["birthday"] = DateFormat("yyyy-MM-dd").format(birthday!);
    }

    return map;
  }
}
