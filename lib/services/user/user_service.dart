import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_model.dart';

///Service to manage Userdata inside a Singleton instance and the [SharedPreferences].
class UserService {
  ///A static instance of the [UserService].
  static final UserService instance = UserService._privateConstructor();

  ///Variable that stores connection to the local data saves-
  late SharedPreferences _prefs;

  ///Variable that stores an instance of the Userdata to access Userdata via Singleton Object-
  late User _user;

  ///The private Constructor that is called to when calling UserService.instance.
  UserService._privateConstructor() {
    print("Starting User Service");
    _init();
  }

  ///Initializes UserData by setting [User] and accessing the local data inside [SharedPreferences].
  ///If the [SharedPreferences] are already set, [User] is initialized with the values stored inside 
  ///the [SharedPreferences]
  void _init() async {
    _prefs = await SharedPreferences.getInstance();

    print("User Service: " +
        (_prefs.getString("birthday") ?? "No birthday found"));

    _user = User(
      name: _prefs.getString("name") ?? "",
      birthday: DateTime.parse(
          _prefs.getString("birthday") ?? "1970-01-01 01:00:00.000"),
      gender: User.stringToGender(_prefs.getString("gender") ?? ""),
    );
    print("User Service finished!");
    print(_user.birthday.toString());
  }

  // Getter

  ///Get the [name] by accessing the Singleton instance [_user].
  String get name => _user.name;

  ///Get the [birthday] as a String by accessing the Singleton instance [_user] and formatting it to
  ///the type [String].
  String get birthdayAsString {
    if (_user.birthday.millisecondsSinceEpoch == 0) return "";

    return DateFormat("dd.MM.yyyy").format(_user.birthday);
  }

  ///Get the [birthday] by accessing the Singleton instance [_user].
  DateTime get birthday => _user.birthday;

  ///Get the [gender] by accessing the Singleton instance [_user].
  Gender get gender => _user.gender;

  // Setter

  ///Set [name] of the user inside the Singleton instance [_user] and inside the [SharedPreferences].
  set name(String name) {
    _user.name = name;
    _prefs.setString("name", name);
  }

  ///Set [birthday] of the user inside the Singleton [instance] and inside the [SharedPreferences].
  set birthday(DateTime birthday) {
    _user.birthday = birthday;
    _prefs.setString("birthday", birthday.toString());
  }

  ///Set [gender] of the user inside the Singleton [instance] and inside the [SharedPreferences].
  set gender(Gender gender) {
    _user.gender = gender;
    _prefs.setString("gender", gender.toString());
  }
}