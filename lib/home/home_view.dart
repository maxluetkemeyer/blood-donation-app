import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'image_carousel_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  ///Build method to build the entrance page, also functioning as the home page.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 250,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: const ImageCarousel(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Text(
            AppLocalizations.of(context)!.homePageViewInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 80, right: 80, top: 30),
          child: Image(
            image: AssetImage("./assets/images/Universitätsklinikum_Münster_Logo.png"),
          ),
        ),
      ],
    );
  }
}
