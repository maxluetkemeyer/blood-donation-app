import 'package:blooddonation/booking/status_views/booked_status_copy/requestcard_widget.dart';
import 'package:blooddonation/booking/status_views/booked_status_copy/stepsection_widget.dart';
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
            if (appointment?.request?.status == RequestStatus.pending.toString() || 0 == 0) {
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
            children: [
              StepSection(
                step: "1",
                textDirection: TextDirection.rtl,
                body: Column(
                  children: const [
                    Image(
                      height: 200,
                      image: NetworkImage("https://ukm-blutspende.de/fileadmin/user_upload/Blutspende/ukm-blutspende-gebaeude-1000x700px.png"),
                    ),
                    Text("Blut ist lebensnotwendiger Bestandteil des menschlichen Lebens. "),
                  ],
                ),
              ),
              const StepSection(
                step: "2",
                textDirection: TextDirection.ltr,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/user_upload/Blutspende/ukm-blutspende-gebaeude-1000x700px.png"),
                ),
              ),
              const StepSection(
                step: "3",
                textDirection: TextDirection.rtl,
                body: Image(
                  height: 200,
                  image: NetworkImage("https://ukm-blutspende.de/fileadmin/user_upload/Blutspende/ukm-blutspende-gebaeude-1000x700px.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
