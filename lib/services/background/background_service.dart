import 'package:blooddonation/services/background/notification_service.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundService {
  //Singleton
  static final BackgroundService _instance = BackgroundService._private();
  factory BackgroundService() => _instance;
  BackgroundService._private() {
    print("Starting Background Service");
  }

  static void initWorkmanager() {
    Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true, // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
    );
  }

  void startBackgroundTask() {
    Workmanager().registerPeriodicTask(
      DateTime.now().toString(),
      "periodicFetchAppointmentStatus",
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      backoffPolicy: BackoffPolicy.linear,
    );
  }

  void stopBackgroundTask() {
    Workmanager().cancelAll();
  }
}

void callbackDispatcher() {
  Workmanager().executeTask((String task, Map<String, dynamic>? inputData) {
    print("Native called background task: $task"); //simpleTask will be emitted here.

    NotificationService().displayNotification(
      channelID: "booking_response",
      channelName: "Booking Status Response",
      channelDescription: "Booking Response Channel Description",
      notificationTitle: "notificationTitle",
      notificationBody: "notificationBody",
      payload: "payload",
    );

    return Future.value(true);
  });
}
