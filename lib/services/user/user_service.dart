import 'package:blooddonation/misc/utils.dart';
import 'package:blooddonation/models/person_model.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:intl/intl.dart';
import 'package:language_picker/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

export 'package:blooddonation/models/person_model.dart';

///Service to manage Userdata inside a Singleton instance and the [SharedPreferences].
class UserService {
  //Singleton
  static final UserService _instance = UserService._private();
  factory UserService() => _instance;
  UserService._private() {
    print("Starting User Service");
    _init();
  }

  ///Variable that stores connection to the local data saves:
  late SharedPreferences _prefs;

  ///Variable that stores an instance of the Userdata to access Userdata via Singleton Object-
  late Person _user;

  ///Preffered Language
  Language _lan = Languages.german;

  ///Initializes UserData by setting [User] and accessing the local data inside [SharedPreferences].
  ///If the [SharedPreferences] are already set, [User] is initialized with the values stored inside
  ///the [SharedPreferences]
  void _init() async {
    _prefs = await SharedPreferences.getInstance();

    print("User Service: ${_prefs.getString("birthday") ?? "No birthday found"}");

    _user = Person(
      name: _prefs.getString("name") ?? "",
      birthday: DateTime.parse(_prefs.getString("birthday") ?? "1970-01-01 01:00:00.000"),
      gender: _prefs.getString("gender") ?? "",
      telephoneNumber: _prefs.getString("telephoneNumber") ?? "",
      firstDonation: _prefs.getBool("firstDonation") ?? true,
    );

    _lan = Language.fromIsoCode(_prefs.getString("user_language") ?? Languages.german.isoCode);
    ProviderService().container.read(localeProvider.state).state = _localeFallback(_lan);

    print("User Service finished!");
  }

  // Getter

  ///Get the [name] by accessing the Singleton instance [_user].
  String? get name => _user.name;

  ///Get the [birthday] as a String by accessing the Singleton instance [_user] and formatting it to
  ///the type [String].
  String get birthdayAsString {
    if (_user.birthday?.millisecondsSinceEpoch == 0) return "";

    return DateFormat("dd.MM.yyyy").format(_user.birthday!);
  }

  ///Get the [birthday] by accessing the Singleton instance [_user].
  DateTime? get birthday => _user.birthday;

  ///Get the [gender] by accessing the Singleton instance [_user].
  String? get gender => _user.gender;

  String? get telephoneNumber => _user.telephoneNumber;
  bool get firstDonation => _user.firstDonation;

  DateTime? get lastDonation {
    String dayString = _prefs.getString("lastDonation") ?? "";

    DateTime? day = DateTime.tryParse(dayString);
    return day;
  }

  Language get language => _lan;

  // Setter

  ///Set [name] of the user inside the Singleton instance [_user] and inside the [SharedPreferences].
  set name(String? name) {
    _user.name = name;
    _prefs.setString("name", name ?? "");
  }

  ///Set [birthday] of the user inside the Singleton [instance] and inside the [SharedPreferences].
  set birthday(DateTime? birthday) {
    _user.birthday = birthday;
    _prefs.setString("birthday", birthday?.toString() ?? "");
  }

  ///Set [gender] of the user inside the Singleton [instance] and inside the [SharedPreferences].
  set gender(String? gender) {
    _user.gender = gender;
    _prefs.setString("gender", gender ?? "");
  }

  set telephoneNumber(String? telephoneNumber) {
    _user.telephoneNumber = telephoneNumber;
    _prefs.setString("telephoneNumber", telephoneNumber ?? "");
  }

  set firstDonation(bool value) {
    _user.firstDonation = value;
    _prefs.setBool("firstDonation", value);
  }

  set lastDonation(DateTime? time) {
    if (time != null) {
      DateTime day = extractDay(time);
      _prefs.setString("lastDonation", day.toString());
    } else {
      _prefs.setString("lastDonation", "");
    }
  }

  set language(Language lan) {
    _lan = lan;
    ProviderService().container.read(localeProvider.state).state = _localeFallback(lan);
    _prefs.setString("user_language", lan.isoCode);
  }

  void reset() {
    _init();
  }
}

Locale _localeFallback(Language language) {
  if (language.isoCode == Languages.english.isoCode) {
    return const Locale("en");
  }

  return const Locale("de");
}
