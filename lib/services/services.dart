import 'package:ukmblooddonation/services/firebase/firebase_service.dart';

class Services {
  static final Services instance = Services._privateConstructor();

  Services._privateConstructor();

  void initServices() {
    print("Start init Services");
    // ignore: unused_local_variable
    FirebaseService fbService = FirebaseService.instance;
  }
}
