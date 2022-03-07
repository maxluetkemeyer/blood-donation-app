import 'package:blooddonation/home/person_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GetInspired extends StatefulWidget {
  const GetInspired({Key? key}) : super(key: key);

  @override
  State<GetInspired> createState() => _GetInspiredState();
}

class _GetInspiredState extends State<GetInspired> {
  int current = 0;
  final int amount = 4;
  final CarouselController controller = CarouselController(); //not disposeable?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Unsere Blutspender:innen"),
      ),*/
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
              PersonWiget(
                image: AssetImage("assets/images/person_1.png"),
                text: "Ich spende beim UKM, weil ich mich hier gut aufgehoben fühle.",
              ),
              PersonWiget(
                image: AssetImage("assets/images/person_2.png"),
                text: "Ich spende Blut, weil ich damit anderen Menschen helfen kann.",
              ),
              PersonWiget(
                image: AssetImage("assets/images/person_3.png"),
                text: "Ich spende beim UKM, weil die Nussecken hier so unglaublich lecker sind.",
              ),
              PersonWiget(
                image: AssetImage("assets/images/person_4.png"),
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
