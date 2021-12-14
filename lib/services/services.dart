import 'dart:io';

import 'package:blooddonation/services/backend_service.dart';

import 'booking/booking_services.dart';
import 'firebase/firebase_service.dart';
import 'user/user_service.dart';

///Class to initialize an [instance] to initialize all Services including
///[UserService], [BookingService] and, if the used Platform is mobile, [FirebaseService]
class Services {
  ///Singleton instance to access all needed services
  static final Services instance = Services._privateConstructor();

  Services._privateConstructor();

  ///Function is used to initialize every needed service, by calling the instances of each service
  void initServices() {
    print("Init Services ...");

    UserService.instance;
    // should be initialized later when booking process first starts
    BookingService.instance;
    BackendService.instance;

    if (Platform.isIOS || Platform.isAndroid) {
      FirebaseService.instance;
    }
  }
}
