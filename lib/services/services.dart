import 'dart:io';
import 'package:blooddonation/services/notification/notification_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'backend/backend_service.dart';
import 'booking/booking_services.dart';
import 'firebase/firebase_service.dart';
import 'provider/provider_service.dart';
import 'user/user_service.dart';

void startServices() {
  print("Initializing Services...");

  ProviderService();
  UserService();
  BookingService();
  BackendService();
  NotificationService();

  //Only start Firebase in Android or iOS Version
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    FirebaseService();
  }
}
