import 'package:flutter/material.dart';

class Anmeldung extends StatelessWidget {
  const Anmeldung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Termin buchen"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Darf ich spenden?"),
          ),
        ],
      ),
    );
  }
}
