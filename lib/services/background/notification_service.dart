import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //Singleton
  static final NotificationService _instance = NotificationService._private();
  factory NotificationService() => _instance;
  NotificationService._private() {
    print("Starting Notification Service");
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int _lastID = 0;

  int _nextID() {
    _lastID++;
    return _lastID;
  }

  Future init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initSettingsAndroid = AndroidInitializationSettings("notification_icon");
    const IOSInitializationSettings initSettingsIOS = IOSInitializationSettings(
      //onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );

    //flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails()
    tz.initializeTimeZones();
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }

    print("Notification!");
  }

  Future<bool> requestIosPermissions() async {
    bool? result =
        await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );

    return result ?? false;
  }

  void displayNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'blooddonation',
      'Blood Donation Status',
      channelDescription: 'Status Updates of your appointment.',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker', //older android versions
    );
    /*const IOSNotificationDetails iosPlatformSpecifics = IOSNotificationDetails(
    );*/
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      _nextID(),
      title,
      body,
      platformChannelSpecifics,
      payload: 'my payload',
    );
  }

  void scheduleNotification(String title, String body, Duration duration) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      _nextID(),
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'blooddonationReminder',
          'Blood Donation Reminder',
          channelDescription: 'Friendly reminder to book a new appointment.',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
