import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

///
/// Firebase Service for Firebase Core and Firebase Cloud Messaging
/// Service build using the Singleton pattern
///
/// Troubleshooting:
/// Get the correct google-services.json file from the team (not included in repo)
///
/// Todo:
/// Apple integration
/// Topics
/// Connect to Notification service
///
class FirebaseService {
  static final FirebaseService instance = FirebaseService._privateConstructor();

  FirebaseService._privateConstructor() {
    print("Try to init fb");
    Firebase.initializeApp().then((FirebaseApp fbApp) {
      fbApp.setAutomaticDataCollectionEnabled(false);

      _cloudMessaging();
    });
  }

  void _cloudMessaging() {
    //Unclear, but needed
    FirebaseMessaging.instance.getToken();

    // Foreground Messages
    FirebaseMessaging.onMessage.listen(_foregroundMessageHandler);

    // Background Messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _foregroundMessageHandler(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');

      RemoteNotification notification = message.notification!;
      print(notification.title);
    }
  }
}

//Documentation:
//There are a few things to keep in mind about your background message handler:
//It must not be an anonymous function. ?????????
//It must be a top-level function (e.g. not a class method which requires initialization).
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // so prop. not needed
  // await Firebase.initializeApp();

  //Prevent auto Notification?

  print("Handling a background message: ${message.notification!.title}");
}
