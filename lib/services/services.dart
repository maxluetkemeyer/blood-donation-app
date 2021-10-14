import 'dart:io';

import 'package:ukmblooddonation/services/firebase/firebase_service.dart';

class Services {
  static final Services instance = Services._privateConstructor();

  Services._privateConstructor();

  void initServices() {
    print("Start init Services");
    if(Platform.isIOS || Platform.isAndroid){
      // ignore: unused_local_variable
      FirebaseService fbService = FirebaseService.instance;
    }
    
  }
}
