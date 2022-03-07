import 'package:background_fetch/background_fetch.dart';
import 'package:blooddonation/services/background/notification_service.dart';

// [Android-only] This "Headless Task" is run when the Android app
// is terminated with enableHeadless: true
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');
  // Do your work here...
  BackgroundFetch.finish(taskId);
}

Future init() async {
  // [Android-only]
  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

  _initPlatformState();
}

Future<void> _initPlatformState() async {
  // Configure BackgroundFetch.
  int status = await BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15,
      stopOnTerminate: false,
      enableHeadless: true,
      requiresBatteryNotLow: false,
      requiresCharging: false,
      requiresStorageNotLow: false,
      requiresDeviceIdle: false,
      requiredNetworkType: NetworkType.ANY,
    ),
    (String taskId) async {
      // <-- Event handler
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      print("LOLOOLOLOLO");

      await NotificationService().init().then(
        (value) {
          NotificationService().displayNotification("title bg", "body bg");

          // IMPORTANT:  You must signal completion of your task or the OS can punish your app
          // for taking too long in the background.
          BackgroundFetch.finish(taskId);
        },
      );
    },
    (String taskId) async {
      // <-- Task timeout handler.
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    },
  );

  print('[BackgroundFetch] configure success: $status');
}

void start() {
  BackgroundFetch.start().then((int status) {
    print('[BackgroundFetch] start success: $status');
  }).catchError((e) {
    print('[BackgroundFetch] start FAILURE: $e');
  });
}

void stop() {
  BackgroundFetch.stop().then((int status) {
    print('[BackgroundFetch] stop success: $status');
  });
}
