import 'package:blooddonation/booking/status_views/booked_status/requestcard_widget.dart';
import 'package:blooddonation/booking/status_views/booked_status/stepsection_widget.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingBookedStatus extends StatelessWidget {
  const BookingBookedStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Consumer(
          builder: (context, ref, child) {
            // ignore: unused_local_variable
            int update = ref.watch(bookedAppointmentUpdateProvider.state).state;
            Appointment? appointment = BookingService().bookedAppointment;

            if (appointment?.request?.status == RequestStatus.declined.toString()) {
              return RequestCard(
                backgroundColor: Colors.grey.shade400,
                onTapFooter: () {},
                status: "declined",
              );
            }
            if (appointment?.request?.status == RequestStatus.pending.toString()) {
              return RequestCard(
                backgroundColor: Colors.amber.shade400,
                onTapFooter: () {},
                status: "pending",
              );
            }

            return RequestCard(
              backgroundColor: Colors.lightGreen.shade600,
              onTapFooter: () {},
              status: "accepted",
            );
          },
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
