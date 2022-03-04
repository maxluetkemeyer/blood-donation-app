import 'package:blooddonation/booking/status_views/booked_status/expandable_panorama_widget.dart';
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
    return RefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(seconds: 1)),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Consumer(
            builder: (context, ref, child) {
              // ignore: unused_local_variable
              int update = ref.watch(bookedAppointmentUpdateProvider.state).state;
              Appointment? appointment = BookingService().bookedAppointment;

              if (appointment?.request?.status == RequestStatus.declined.toString()) {
                return RequestCard(
                  //backgroundColor: const Color.fromRGBO(193, 26, 89, 1),
                  backgroundColor: Colors.black87,
                  onTapFooter: () {},
                  status: "declined",
                  textColor: Colors.white,
                );
              }
              if (appointment?.request?.status == RequestStatus.pending.toString()) {
                return RequestCard(
                  backgroundColor: Colors.blueGrey.shade200,
                  onTapFooter: () {},
                  status: "pending",
                );
              }

              return RequestCard(
                backgroundColor: Theme.of(context).primaryColor,
                onTapFooter: () {},
                status: "accepted",
                textColor: Colors.white,
              );
            },
          ),
          const SizedBox(height: 10),
          Column(
            children: const [
              StepSection(
                step: "1",
                titel: "Willkommen am UKM",
                body: ExpandablePanorama(
                  title: "Willkommen am UKM",
                  image: AssetImage("assets/images/entrance_panorama.jpg"),
                ),
              ),
              StepSection(
                step: "2",
                titel: "Wir befinden uns im 1. Stock",
                body: ExpandablePanorama(
                  title: "Wir befinden uns im 1. Stock",
                  image: AssetImage("assets/images/pan_0.jpg"),
                ),
              ),
              StepSection(
                step: "3",
                titel: "Durch die Tür",
                body: ExpandablePanorama(
                  title: "Durch die Tür",
                  image: AssetImage("assets/images/pan_1.jpg"),
                ),
              ),
              StepSection(
                step: "4",
                titel: "Anmelden",
                body: ExpandablePanorama(
                  title: "Anmelden",
                  image: AssetImage("assets/images/pan_2.jpg"),
                ),
              ),
              StepSection(
                step: "5",
                titel: "Essen genießen",
                body: Image(
                  image: AssetImage("assets/images/room_2.jpg"),
                ),
              ),
              StepSection(
                step: "6",
                titel: "Entspannen",
                body: Image(
                  image: AssetImage("assets/images/room_1.jpg"),
                ),
              ),
              StepSection(
                step: "7",
                titel: "Frische Luft genießen",
                body: Image(
                  image: AssetImage("assets/images/room_3.jpg"),
                ),
              ),
              StepSection(
                step: "8",
                titel: "Bis zum nächsten mal",
                body: Image(
                  image: AssetImage("assets/images/room_0.jpg"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
