import 'package:blooddonation/home/get_inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Entrance page, also functioning as the home page.
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            SizedBox(
              width: width,
              child: const AspectRatio(
                aspectRatio: 0.6,
                child: Image(
                  image: AssetImage("assets/images/home_background.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 14,
                      top: 40,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Noch keinen\nBlutspendetermin?\nÄndern wir.",
                          style: TextStyle(
                            fontSize: width * 0.07,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: CupertinoTheme(
                      data: const CupertinoThemeData(
                        primaryColor: Colors.white,
                      ),
                      child: CupertinoButton.filled(
                        pressedOpacity: 0.7,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Termin finden",
                              style: TextStyle(
                                fontSize: width * 0.06,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Theme.of(context).primaryColor,
                              size: width * 0.1,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          //
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 10,
                    top: 15,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Warum Blut spenden gar\nnicht schwer ist",
                        style: TextStyle(
                          fontSize: width * 0.06,
                          color: Theme.of(context).primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      CupertinoButton.filled(
                        child: const Text("Inspirieren lassen"),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetInspired(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
