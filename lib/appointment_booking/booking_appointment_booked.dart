import 'package:blooddonation/appointment_booking/booking_appointment_card_widget.dart';
import 'package:blooddonation/appointment_booking/step_widget.dart';
import 'package:flutter/material.dart';

class AppointmentBookedView extends StatefulWidget {
  const AppointmentBookedView({Key? key}) : super(key: key);

  @override
  State<AppointmentBookedView> createState() => _AppointmentBookedViewState();
}

class _AppointmentBookedViewState extends State<AppointmentBookedView> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tapped
            ? AppointmentCard(
                backgroundColor: Colors.lightGreen.shade600,
                onTapFooter: () => setState(() {
                  tapped = !tapped;
                }),
                status: "accepted",
              )
            : AppointmentCard(
                backgroundColor: Colors.amber.shade400,
                onTapFooter: () => setState(() {
                  tapped = !tapped;
                }),
                status: "pending",
              ),
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
}
