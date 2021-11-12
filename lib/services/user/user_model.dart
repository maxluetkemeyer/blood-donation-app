class User {
  String name;
  DateTime birthday;
  Gender gender;

  User({
    required this.name,
    required this.birthday,
    required this.gender,
  });

  static Gender stringToGender(String string) {
    switch (string) {
      case "male":
        return Gender.male;
      case "female":
        return Gender.female;
      case "diverse":
        return Gender.diverse;
      default:
        return Gender.none;
    }
  }
}

enum Gender { none, male, female, diverse }
