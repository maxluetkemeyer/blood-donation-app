// ignore_for_file: unnecessary_statements

import 'dart:io';

import 'firebase/firebase_service.dart';
import 'user/user_service.dart';



class Services {
  static final Services instance = Services._privateConstructor();

  Services._privateConstructor();

  void initServices() {
    print("Init Services ...");

    UserService.instance;

    if (Platform.isIOS || Platform.isAndroid) {
      FirebaseService.instance;
    }
  }
}
