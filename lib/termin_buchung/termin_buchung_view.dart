import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ukmblutspende/termin_buchung/buchung_view.dart';

import 'frage.dart';
import 'frage_model.dart';

class TerminBuchung extends StatefulWidget {
  const TerminBuchung({Key? key}) : super(key: key);

  @override
  _TerminBuchungState createState() => _TerminBuchungState();
}

class _TerminBuchungState extends State<TerminBuchung> {
  Frage testFrage = Frage(
    "Sind Sie positiv auf HIV getestet worden oder haben Sie die Befürchtung evtl. HIV-positiv zu sein?",
    false,
  );
  Frage testFrage2 = Frage(
    "Wurden bei Ihnen oder einem Ihrer Blutsverwandten 1. Grades die Creutzfeldt-Jakob-Krankheit erkannt?",
    false,
  );

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Neue Terminbuchung",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: PageView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    FragenWidget(
                      testFrage,
                      () {
                        _controller.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    FragenWidget(
                      testFrage2,
                      () {
                        _controller.animateToPage(
                          2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    FragenWidget(
                      testFrage,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Buchung()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Möchtest du die Buchung abbrechen?'),
            content: Text('Dein bisheriger Fortschritt geht verloren.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Ja'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Nein'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
