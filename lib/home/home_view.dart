import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Entrance page, also functioning as the home page.
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

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
