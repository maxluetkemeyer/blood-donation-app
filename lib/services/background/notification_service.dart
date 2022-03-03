import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //Singleton
  static final NotificationService _instance = NotificationService._private();
  factory NotificationService() => _instance;
  NotificationService._private() {
    print("Starting Notification Service");

    init();
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int _lastID = 0;

  void init() async {
    var initSettingsAndroid = const AndroidInitializationSettings("notification_icon");
    var initSettingsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: initSettingsAndroid,
        iOS: initSettingsIOS,
      ),
      onSelectNotification: (payload) => print(payload),
    );

    //Init timezones package for scheduled notifications
    tz.initializeTimeZones();
  }

  Future<bool> requestIOSPermission() async {
    bool? result =
        await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
    return result ?? false;
  }

  void displayNotification({
    required String channelID,
    required String channelName,
    required String channelDescription,
    required String notificationTitle,
    required String notificationBody,
    required String payload,
    Duration? duration,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelID,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      category: "event",
      color: Colors.blue,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      _nextID(),
      notificationTitle,
      notificationBody,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void scheduleNotification() async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        category: "reminder",
      ),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      _nextID(),
      'scheduled title',
      'scheduled body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails,
      androidAllowWhileIdle: true,
      payload: 'item x',
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  int _nextID() {
    _lastID++;
    return _lastID;
  }
}
