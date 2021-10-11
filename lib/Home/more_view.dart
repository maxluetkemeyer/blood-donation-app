import 'package:flutter/material.dart';
import 'package:ukmblooddonation/Nutzerdaten/nutzerdaten.dart';
import 'package:ukmblooddonation/impressum/impressum.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Nutzerdaten())),
            child: Text("Nutzerdaten"),
          ),
          TextButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Impressum())),
            child: Text("Impressum"),
          ),
        ],
      ),
    );
  }
}
