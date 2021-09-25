import 'package:flutter/material.dart';
import 'package:ukmblutspende/onboard/onboarding.dart';

class FirstContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoard()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:0.0,vertical: 15),
                child: SizedBox(
                  child: Center(
                      child: Text(
                    'Weiter zur Dateneingabe',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 30),
                  )),
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image(image: AssetImage('assets/images/1.png')),
        ],
      ),
    );
  }
}
