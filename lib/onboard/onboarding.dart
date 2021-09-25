import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:ukmblutspende/Home/home.dart';

class OnBoard extends StatefulWidget {
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  DateTime bDate = DateTime.now();

  void _presentDatePicker() {
    showDatePicker(
      context: context, 
      locale : const Locale("de","DE"),
      initialDate: DateTime.now(), 
      firstDate: DateTime(1899), 
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        bDate = pickedDate;
      });
    });
  }

  @override
  Widget build(context) {
    final _nameController = TextEditingController();
    final _fNameController = TextEditingController();
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Vorname'),
                    controller: _fNameController,
                    onSubmitted: (_) {
                      //fName = input_fName;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Nachname'),
                    controller: _nameController,
                    onSubmitted: (_) {
                      //name = input_Name;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(bDate.day == DateTime.now().day
                              ? 'Geburtsdatum'
                              : 'Geburtstag auswählen: ${DateFormat.yMd().format(bDate)}')),
                      TextButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        child: Text(
                          'Geburtstag wählen',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text('Daten hinzufügen'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    //foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).textTheme.button.color),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    if(_nameController.text==''||_fNameController.text==''||bDate.day==DateTime.now().day){
                      return;
                    }

                    prefs.setString("vorname", _fNameController.text);
                    prefs.setString("name", _nameController.text);
                    prefs.setString("bday", bDate.toString());
                    prefs.setBool("alreadyOnboarded", true);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//}
