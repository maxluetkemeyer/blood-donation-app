import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget buildImageCarousel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
        ),
        items: [1, 2, 3, 4].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      './assets/images/image_$i.png',
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
