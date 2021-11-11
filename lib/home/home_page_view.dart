import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration:
                            const BoxDecoration(color: Color(0xff003866)),
                        child: Image(
                          image: AssetImage(
                            './assets/images/image_$i.png',
                          ),
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 15,
            top: 20,
            right: 15,
          ),
          child: Text(
            "Unter „Termine“ können Sie einfach und unkompliziert einen Blutspendetermin am Universitätsklinikum Münster buchen.\nWenn Sie die Anschrift der UKM-Blutspende oder eine Wegbeschreibung suchen, wählen Sie „Karte“ aus. \nAlle häufigen Fragen und Antworten auf diese Fragen finden Sie unter „FAQ“.",
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
    );
  }
}
