// ignore_for_file: unnecessary_statements

import 'dart:io';

import 'booking/booking_services.dart';
import 'firebase/firebase_service.dart';
import 'user/user_service.dart';

class Services {
  static final Services instance = Services._privateConstructor();

  Services._privateConstructor();

  void initServices() {
    print("Init Services ...");

    UserService.instance;
    // should be initialized later when booking process first starts
    BookingService.instance;

    if (Platform.isIOS || Platform.isAndroid) {
      FirebaseService.instance;
    }
  }
}
