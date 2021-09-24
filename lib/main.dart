//@dart = 2.9

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './Home/home.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
/*
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ProviderScope(child: App()));
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Text("oh no, firebase fehler");
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return CircularProgressIndicator();
    }

    return MyApp();
  }
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  final Color primCol = Color(0xff003866);
  final Color accCol = Color(0xff93001D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UKM Blutspende",
      debugShowCheckedModeBanner: false,
      // TODO: Theme Ändern!!
      theme: ThemeData(
        // Primäre Farbe des Dokumentes (UKM Logo-Farbe dunkel)
        appBarTheme: AppBarTheme(
          backgroundColor: primCol,
        ),

        primaryColor: primCol,
        dividerColor: accCol,

        fontFamily: 'Roboto',

        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.white),
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: primCol,
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}

// Provider
final tappedDayProvider = StateProvider<bool>((ref) {
  return false;
});

final selectedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
