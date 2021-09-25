import 'package:flutter/material.dart';
import 'package:ukmblutspende/Home/menu.dart';

/// This is the stateful widget that the main application instantiates.
class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Impressum')),
        drawer: Menu(),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text('Wer sind wir?',
                          style:
                              TextStyle(color: Colors.black, fontSize: 23.0)),
                      SizedBox(height: 7),
                      Text('Wir sind blablabla',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      SizedBox(height: 30),
                      Text('Kontakt',
                          style:
                              TextStyle(color: Colors.black, fontSize: 23.0)),
                      SizedBox(height: 7),
                      Text('UKM',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0)),
                      Text(
                          'Zentralklinikum\nAlbert-Schweitzer-Campus 1, Gebäude: A1\nAnfahrtsadresse: Albert-Schweitzer-Straße 33\n48149 Münster\nT +49 251 83-55555\nT +49 251 83-56960\ninfo@­ukmuenster.­de',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      SizedBox(height: 30),
                      Text('Lizenzen',
                          style:
                              TextStyle(color: Colors.black, fontSize: 23.0)),
                      SizedBox(height: 7),
                      Text('Lizenzen',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ]))));
  }
}
