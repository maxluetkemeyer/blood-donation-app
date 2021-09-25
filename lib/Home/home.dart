//@dart = 2.9

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Home/menu.dart';
import '../termin_buchung/termin_buchung_view.dart';


class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UKM Blutspende',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Color(0xff003866)),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TerminBuchung()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                        child: Text(
                          'Terminanmeldung',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: Menu(),
    );
  }
}
