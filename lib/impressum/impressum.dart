import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Impressum')),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Text('Wer sind wir?',
                  style: TextStyle(color: Colors.black, fontSize: 23.0)),
            ),
            SizedBox(height: 10),
            Center(
              child: Text('keine Ahnung',
                  style: TextStyle(color: Colors.black, fontSize: 17.0)),
            )
          ],
        ),
        SizedBox(height: 25),
        Column(
          children: [
            Center(
              child: Text('Kontakt',
                  style: TextStyle(color: Colors.black, fontSize: 23.0)),
            ),
            SizedBox(height: 10),
            Center(
              child: Text('Kontaktdaten',
                  style: TextStyle(color: Colors.black, fontSize: 17.0)),
            )
          ],
        ),
        SizedBox(height: 25),
        Column(
          children: [
            Center(
              child: Text('Lizenzen',
                  style: TextStyle(color: Colors.black, fontSize: 23.0)),
            ),
            SizedBox(height: 10),
            Center(
              child: Text('blabla',
                  style: TextStyle(color: Colors.black, fontSize: 17.0)),
            )
          ],
        ),
      ])),
    );
  }
}
