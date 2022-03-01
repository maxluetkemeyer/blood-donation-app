import 'package:blooddonation/services/background/notification_service.dart';
import 'package:flutter/material.dart';

import "package:blooddonation/services/background/background_service.dart" as bag;

///Entrance page, also functioning as the home page.
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Image(
          image: AssetImage("./assets/images/home_screen_design_mock.png"),
        ),
        ElevatedButton(
          onPressed: () {
            NotificationService().requestIosPermissions();
          },
          child: const Text("Request Ios Permissions"),
        ),
        ElevatedButton(
          onPressed: () {
            NotificationService().displayNotification("title", "body");
          },
          child: const Text("Notification"),
        ),
        const Divider(),
        ElevatedButton(
          onPressed: () => bag.init(),
          child: const Text("Init Background Fetch"),
        ),
        ElevatedButton(
          onPressed: () => bag.start(),
          child: const Text("Start Background Fetch"),
        ),
        ElevatedButton(
          onPressed: () => bag.stop(),
          child: const Text("Stop Background Fetch"),
        ),
      ],
    );
  }
}
