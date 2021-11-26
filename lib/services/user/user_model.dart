///Class to model the User, who is saved inside the [UserService]
class User {
  String name;
  DateTime birthday;
  Gender gender;

  ///Constructor for the User class
  User({
    required this.name,
    required this.birthday,
    required this.gender,
  });

  ///Function to get the Enum value for each fitting String
  ///
  ///returns [Gender] specifically as [String]
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

///Enum for the Gender of the user. Gender can be [none], [male], [female] or [diverse]
enum Gender { none, male, female, diverse }
