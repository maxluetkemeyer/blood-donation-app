import 'package:flutter/material.dart';

class ImprintView extends StatelessWidget {
  const ImprintView({Key? key}) : super(key: key);

  ///Build method to show the user imprint information and licenses utilized by the application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressum'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Angaben des Herausgebers',
            style: _headTextStyle,
          ),
          const SizedBox(height: 10),
          const SelectableText(
            'European Research Center for Information Systems (ERCIS) \nLeonardo-Campus 3 \n48149 Münster	\n\nTel.: +49 251 8338100 \nFax: +49 251 8338109 \ninfo@ercis.org ',
            style: _bodyTextStyle,
          ),
          const SizedBox(height: 30),
          const Text(
            'Kontakt',
            style: _headTextStyle,
          ),
          const SizedBox(height: 10),
          const SelectableText(
            'Universitätsklinikum Münster',
            style: _bodyTextStyle,
          ),
          const SelectableText(
            'Zentralklinikum\nAlbert-Schweitzer-Campus 1, Gebäude: A1\nAnfahrtsadresse: Albert-Schweitzer-Straße 33\n48149 Münster\n\nTel.: +49 251 8355555\nFax: +49 251 8356960\ninfo@­ukmuenster.­de',
            style: _bodyTextStyle,
          ),
          const SizedBox(height: 30),
          const Text(
            'Lizenzen',
            style: _headTextStyle,
          ),
          const SizedBox(height: 10),
          const SelectableText(
            'https://www.openstreetmap.org/copyright',
            style: _bodyTextStyle,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () => showAboutDialog(
                context: context,
                applicationIcon: const Image(
                  width: 50,
                  image: AssetImage("assets/images/logo_square.png"),
                ),
                applicationVersion: "0.3",
                applicationName: "UKM Blutspende",
                children: [
                  const Image(
                    //width: 50,
                    image: AssetImage("assets/images/logo_transparent.png"),
                  ),
                ],
              ),
              child: const Text(
                "More Info",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _headTextStyle = TextStyle(color: Colors.black, fontSize: 23.0);
const TextStyle _bodyTextStyle = TextStyle(color: Colors.black, fontSize: 18.0);
