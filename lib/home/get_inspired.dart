import 'package:blooddonation/home/home_static_view.dart';
import 'package:blooddonation/home/person_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetInspired extends StatefulWidget {
  const GetInspired({Key? key}) : super(key: key);

  @override
  State<GetInspired> createState() => _GetInspiredState();
}

class _GetInspiredState extends State<GetInspired> {
  int current = 0;
  final int amount = 5;
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
            items: [
              const HomeStatic(),
              PersonWiget(
                image: const AssetImage("assets/images/person_1.png"),
                text: AppLocalizations.of(context)!.getInspiredCarouselSliderPerson1,
              ),
              PersonWiget(
                image: const AssetImage("assets/images/person_2.png"),
                text: AppLocalizations.of(context)!.getInspiredCarouselSliderPerson2,
              ),
              PersonWiget(
                image: const AssetImage("assets/images/person_3.png"),
                text: AppLocalizations.of(context)!.getInspiredCarouselSliderPerson3,
              ),
              PersonWiget(
                image: const AssetImage("assets/images/person_4.png"),
                text: AppLocalizations.of(context)!.getInspiredCarouselSliderPerson4,
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
