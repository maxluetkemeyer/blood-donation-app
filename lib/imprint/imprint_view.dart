import 'package:flutter/material.dart';

class ImprintView extends StatelessWidget {
  const ImprintView({Key? key}) : super(key: key);

  ///Build method to show the user imprint information and licenses utilized by the application.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressum'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 10),
                Text(
                  'Angaben des Herausgebers',
                  style: TextStyle(color: Colors.black, fontSize: 23.0),
                ),
                SizedBox(height: 7),
                Text(
                  'European Research Center for Information Systems (ERCIS) \nLeonardo-Campus 3 \n48149 Münster	\n\nTel.: +49 251 8338100 \nFax: +49 251 8338109 \ninfo@ercis.org ',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                SizedBox(height: 30),
                Text(
                  'Kontakt',
                  style: TextStyle(color: Colors.black, fontSize: 23.0),
                ),
                SizedBox(height: 7),
                Text(
                  'Universitätsklinikum Münster',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                Text(
                  'Zentralklinikum\nAlbert-Schweitzer-Campus 1, Gebäude: A1\nAnfahrtsadresse: Albert-Schweitzer-Straße 33\n48149 Münster\n\nTel.: +49 251 8355555\nFax: +49 251 8356960\ninfo@­ukmuenster.­de',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                SizedBox(height: 30),
                Text(
                  'Lizenzen',
                  style: TextStyle(color: Colors.black, fontSize: 23.0),
                ),
                SizedBox(height: 7),
                Text(
                  'https://www.openstreetmap.org/copyright',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
