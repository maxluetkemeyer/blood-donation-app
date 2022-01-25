import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  ///Build method to build the entrance page, also functioning as the home page.
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        Image(
          image: AssetImage("./assets/images/home_screen_design_mock.png"),
        ),
      ],
    );
  }
}
