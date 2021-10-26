import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_model.dart';

class UserService {
  static final UserService instance = UserService._privateConstructor();

  late SharedPreferences _prefs;

  late User _user;

  UserService._privateConstructor() {
    print("Starting User Service");
    _init();
  }

  void _init() async {
    _prefs = await SharedPreferences.getInstance();

    print("User Service: " +
        (_prefs.getString("birthday") ?? "No birthday found"));

    _user = User(
      name: _prefs.getString("name") ?? "",
      birthday: DateTime.parse(
          _prefs.getString("birthday") ?? "1970-01-01 01:00:00.000"),
    );
  }

  String get name => _user.name;
  String get birthdayAsString {
    if (_user.birthday.millisecondsSinceEpoch == 0) return "";

    return DateFormat("dd.MM.yyyy").format(_user.birthday);
  }

  DateTime get birthday => _user.birthday;

  set name(String name) {
    _user.name = name;
    _prefs.setString("name", name);
  }

  set birthday(DateTime birthday) {
    _user.birthday = birthday;
    _prefs.setString("birthday", birthday.toString());
  }
}
