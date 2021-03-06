import 'package:blooddonation/home/home_static.dart';
import 'package:blooddonation/home/person_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int current = 0;
  final int amount = 5;
  final CarouselController controller = CarouselController(); //not disposeable?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 15),
              height: MediaQuery.of(context).size.height,
              disableCenter: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
            ),
            items: const [
              HomeStatic(),
              PersonWiget(
                image: AssetImage("assets/images/persons/person_1.jpg"),
                text: "Ich spende beim UKM, weil ich mich hier gut aufgehoben fühle.",
              ),
              PersonWiget(
                image: AssetImage("assets/images/persons/person_2.jpg"),
                text: "Ich spende beim UKM, weil die Nussecken hier so unglaublich lecker sind.",
              ),
              PersonWiget(
                image: AssetImage("assets/images/persons/person_3.jpg"),
                text: "Ich spende Blut, weil ich damit anderen Menschen helfen kann.", 
              ),
              PersonWiget(
                image: AssetImage("assets/images/persons/person_4.jpg"),
                text: "Wir gehen immer mit unserer WG Blut spenden. Das ist direkt viel lustiger.",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < amount; i++)
                i == current
                    ? Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(8),
                      )
                    : Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(8),
                      ),
            ],
          ),
        ],
      ),
    );
  }
}
