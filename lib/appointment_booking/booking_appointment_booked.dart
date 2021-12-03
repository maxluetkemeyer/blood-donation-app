import 'package:blooddonation/appointment_booking/step_widget.dart';
import 'package:flutter/material.dart';

class AppointmentBookedView extends StatelessWidget {
  AppointmentBookedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myCard,
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
          child: Column(
            children: const [
              StepSection(
                step: "1",
                textDirection: TextDirection.rtl,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/_processed_/b/2/csm__MG_6838_01_d1d5020eec.jpg"),
                ),
              ),
              StepSection(
                step: "2",
                textDirection: TextDirection.ltr,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/_processed_/4/2/csm__MG_6837_01_fad06c8048.jpg"),
                ),
              ),
              StepSection(
                step: "3",
                textDirection: TextDirection.rtl,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/_processed_/0/7/csm__MG_6885_01_4435be8dfe.jpg"),
                ),
              ),
              StepSection(
                step: "4",
                textDirection: TextDirection.ltr,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/_processed_/1/4/csm__MG_6848_01_03c6bd14a1.jpg"),
                ),
              ),
              StepSection(
                step: "5",
                textDirection: TextDirection.rtl,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/_processed_/e/d/csm__MG_6907_01_a32da21a41.jpg"),
                ),
              ),
              StepSection(
                step: "6",
                textDirection: TextDirection.ltr,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/_processed_/9/d/csm__MG_6931_01_080dc74f89.jpg"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  final Widget myCard = Card(
    color: Colors.amber.shade400,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  Text(
                    "11",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Dez",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 38, left: 20),
                child: Text(
                  "10:30",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "pending",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
              label: const Icon(Icons.open_in_new_outlined),
              icon: const Text("Ihr Blutspendetermin am UKM"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
