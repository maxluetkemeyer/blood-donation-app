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
        birthday: json["birthday"],
        gender: json["gender"],
        firstDonation: json["firstDonation"],
        telephoneNumber: json["telephoneNumber"],
      );
}
