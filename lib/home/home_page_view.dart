import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'build_carousel.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: buildImageCarousel()),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 80,
              right: 80,
              top: 30,
            ),
            child: Image(
              image: AssetImage(
                  "./assets/images/Universitätsklinikum_Münster_Logo.png"),
            ),
          )
        ],
      ),
    );
  }
}
