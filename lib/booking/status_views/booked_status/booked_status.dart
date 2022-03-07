import 'dart:async';

import 'package:blooddonation/app.dart';
import 'package:blooddonation/booking/status_views/booked_status/expandable_panorama_widget.dart';
import 'package:blooddonation/booking/status_views/booked_status/requestcard_widget.dart';
import 'package:blooddonation/booking/status_views/booked_status/stepsection_widget.dart';
import 'package:blooddonation/services/backend/requests/cancel_appointment.dart';
import 'package:blooddonation/services/backend/requests/get_status.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingBookedStatus extends StatefulWidget {
  const BookingBookedStatus({Key? key}) : super(key: key);

  @override
  State<BookingBookedStatus> createState() => _BookingBookedStatusState();
}

class _BookingBookedStatusState extends State<BookingBookedStatus> {
  late Timer refreshTimer;

  Future refreshStatus() async {
    return getRequestStatus(appointmentId: BookingService().bookedAppointment!.id);
  }

  Future cancel() async {
    refreshTimer.cancel();
    bool success = await cancelAppointment(appointmentId: BookingService().bookedAppointment!.id);

    //if success is false -> something went wrong in the process
    print(success);

    //Clear BookingService reference
    BookingService().bookedAppointment = null;

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 1)), (route) => false);
  }

  @override
  void initState() {
    super.initState();

    if (BookingService().bookedAppointment?.request?.status == RequestStatus.pending.name) {
      refreshTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
        refreshStatus();
      });
    }
  }

  @override
  void dispose() {
    refreshTimer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshStatus,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Consumer(
            builder: (context, ref, child) {
              // ignore: unused_local_variable
              int update = ref.watch(bookedAppointmentUpdateProvider.state).state;
              Appointment? appointment = BookingService().bookedAppointment;

              if (appointment?.request?.status == RequestStatus.declined.name) {
                return RequestCard(
                  //backgroundColor: const Color.fromRGBO(193, 26, 89, 1),
                  backgroundColor: Colors.black87,
                  onRefresh: refreshStatus,
                  onCancel: cancel,
                  appointment: appointment!,
                  textColor: Colors.white,
                );
              }
              if (appointment?.request?.status == RequestStatus.pending.name) {
                return RequestCard(
                  backgroundColor: Colors.blueGrey.shade200,
                  onRefresh: refreshStatus,
                  onCancel: cancel,
                  appointment: appointment!,
                );
              }

              if (appointment?.request?.status == RequestStatus.accepted.name) {
                return RequestCard(
                  backgroundColor: Colors.blueGrey.shade200,
                  onRefresh: refreshStatus,
                  onCancel: cancel,
                  appointment: appointment!,
                );
              }

              return RequestCard(
                backgroundColor: Colors.white,
                onRefresh: refreshStatus,
                onCancel: cancel,
                appointment: EmptyAppointment(),
                textColor: Colors.black,
              );
            },
          ),
          const SizedBox(height: 10),
          const StepSection(
            step: "1",
            titel: "Willkommen am UKM",
            body: ExpandablePanorama(
              key: ValueKey("step_section_1"),
              title: "Willkommen am UKM",
              image: AssetImage("assets/images/entrance_panorama.jpg"),
            ),
          ),
          const StepSection(
            step: "2",
            titel: "Wir befinden uns im 1. Stock",
            body: ExpandablePanorama(
              key: ValueKey("step_section_2"),
              title: "Wir befinden uns im 1. Stock",
              image: AssetImage("assets/images/pan_0.jpg"),
            ),
          ),
          const StepSection(
            step: "3",
            titel: "Durch die Tür",
            body: ExpandablePanorama(
              key: ValueKey("step_section_3"),
              title: "Durch die Tür",
              image: AssetImage("assets/images/pan_1.jpg"),
            ),
          ),
          const StepSection(
            step: "4",
            titel: "Anmelden",
            body: ExpandablePanorama(
              key: ValueKey("step_section_4"),
              title: "Anmelden",
              image: AssetImage("assets/images/pan_2.jpg"),
            ),
          ),
          const StepSection(
            step: "5",
            titel: "Essen genießen",
            body: Image(
              key: ValueKey("step_section_5"),
              image: AssetImage("assets/images/room_2.jpg"),
            ),
          ),
          const StepSection(
            step: "6",
            titel: "Entspannen",
            body: Image(
              key: ValueKey("step_section_6"),
              image: AssetImage("assets/images/room_1.jpg"),
            ),
          ),
          const StepSection(
            step: "7",
            titel: "Frische Luft genießen",
            body: Image(
              key: ValueKey("step_section_7"),
              image: AssetImage("assets/images/room_3.jpg"),
            ),
          ),
          const StepSection(
            step: "8",
            titel: "Bis zum nächsten mal",
            body: Image(
              key: ValueKey("step_section_8"),
              image: AssetImage("assets/images/room_0.jpg"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
