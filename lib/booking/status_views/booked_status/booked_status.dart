import 'dart:async';

import 'package:blooddonation/app.dart';
import 'package:blooddonation/booking/status_views/booked_status/expandable_panorama_widget.dart';
import 'package:blooddonation/booking/status_views/booked_status/requestcard_widget.dart';
import 'package:blooddonation/booking/status_views/booked_status/stepsection_widget.dart';
import 'package:blooddonation/services/backend/requests/cancel_appointment.dart';
import 'package:blooddonation/services/backend/requests/get_status.dart';
import 'package:blooddonation/services/background/notification_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:blooddonation/services/background/background_service.dart' as background;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingBookedStatus extends StatefulWidget {
  const BookingBookedStatus({Key? key}) : super(key: key);

  @override
  State<BookingBookedStatus> createState() => _BookingBookedStatusState();
}

class _BookingBookedStatusState extends State<BookingBookedStatus> {
  late Timer refreshTimer;

  Future refreshStatus() async {
    bool request = await getRequestStatus(appointmentId: BookingService().bookedAppointment!.id);
    if (!request) {
      cancel();
      return;
    }

    if (BookingService().bookedAppointment?.request?.status != RequestStatus.pending.name) {
      refreshTimer.cancel();
      NotificationService().displayNotification("Blutspendetermin", "Es gibt Neuigkeiten zu Ihrem Blutspendetermin!");
    }
  }

  Future cancel() async {
    // ignore: unused_local_variable
    bool success = await cancelAppointment(appointmentId: BookingService().bookedAppointment!.id);
    //Clear BookingService reference
    BookingService().bookedAppointment = null;

    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 1)), (route) => false);

    // ignore: unnecessary_null_comparison
    if (refreshTimer != null) {
      refreshTimer.cancel();
    }

    //Stop background task
    background.stop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.bookingAppointmentCanceledFeedback),
      ),
    );
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
                  backgroundColor: Colors.black87,
                  onRefresh: refreshStatus,
                  onCancel: cancel,
                  appointment: appointment!,
                  status: AppLocalizations.of(context)!.requestCardStateDeclined,
                  textColor: Colors.white,
                );
              }
              if (appointment?.request?.status == RequestStatus.pending.name) {
                return RequestCard(
                  backgroundColor: Colors.blueGrey.shade200,
                  onRefresh: refreshStatus,
                  onCancel: cancel,
                  appointment: appointment!,
                  status: AppLocalizations.of(context)!.requestCardStatePending,
                );
              }

              if (appointment?.request?.status == RequestStatus.accepted.name) {
                return RequestCard(
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onRefresh: refreshStatus,
                  onCancel: cancel,
                  appointment: appointment!,
                  status: AppLocalizations.of(context)!.requestCardStateAccepted,
                );
              }

              return RequestCard(
                backgroundColor: Colors.white,
                onRefresh: refreshStatus,
                onCancel: cancel,
                appointment: EmptyAppointment(),
                status: "error",
                textColor: Colors.black,
              );
            },
          ),
          const SizedBox(height: 10),
          StepSection(
            step: "0",
            titel: AppLocalizations.of(context)!.bookedStepSection0,
            text: AppLocalizations.of(context)!.bookedStepSectionText0,
            body: const Image(
              key: ValueKey("step_section_0"),
              image: AssetImage("assets/images/logo_transparent.png"),
            ),
          ),
          StepSection(
            step: "1",
            titel: AppLocalizations.of(context)!.bookedStepSection1,
            text: AppLocalizations.of(context)!.bookedStepSectionText1,
            body: const Text(""),
          ),
          StepSection(
            step: "2",
            titel: AppLocalizations.of(context)!.bookedStepSection2,
            text: AppLocalizations.of(context)!.bookedStepSectionText2,
            body: ExpandablePanorama(
              key: const ValueKey("step_section_2"),
              title: (AppLocalizations.of(context)!.bookedStepSection2),
              image: const AssetImage("assets/images/entrance_panorama.jpg"),
            ),
          ),
          StepSection(
            step: "3",
            titel: AppLocalizations.of(context)!.bookedStepSection3,
            text: AppLocalizations.of(context)!.bookedStepSectionText3,
            body: ExpandablePanorama(
              key: const ValueKey("step_section_3"),
              title: AppLocalizations.of(context)!.bookedStepSection3,
              image: const AssetImage("assets/images/pan_1.jpg"),
            ),
          ),
          StepSection(
            step: "4",
            titel: AppLocalizations.of(context)!.bookedStepSection4,
            text: AppLocalizations.of(context)!.bookedStepSectionText4,
            body: ExpandablePanorama(
              key: const ValueKey("step_section_3"),
              title: AppLocalizations.of(context)!.bookedStepSection3,
              image: const AssetImage("assets/images/pan_2.jpg"),
            ),
          ),
          StepSection(
            step: "5",
            titel: AppLocalizations.of(context)!.bookedStepSection5,
            text: AppLocalizations.of(context)!.bookedStepSectionText5,
            body: const Text(""),
          ),
          StepSection(
            step: "6",
            titel: AppLocalizations.of(context)!.bookedStepSection6,
            text: AppLocalizations.of(context)!.bookedStepSectionText6,
            body: const Text(""),
          ),
          StepSection(
            step: "7",
            titel: AppLocalizations.of(context)!.bookedStepSection7,
            text: AppLocalizations.of(context)!.bookedStepSectionText7,
            body: const Text(""),
          ),
          StepSection(
            step: "8",
            titel: AppLocalizations.of(context)!.bookedStepSection8,
            text: AppLocalizations.of(context)!.bookedStepSectionText8,
            body: const Image(
              key: ValueKey("step_section_8"),
              image: AssetImage("assets/images/room_3.jpg"),
            ),
          ),
          StepSection(
            step: "9",
            titel: AppLocalizations.of(context)!.bookedStepSection9,
            text: AppLocalizations.of(context)!.bookedStepSectionText9,
            body: const Image(
              key: ValueKey("step_section_9"),
              image: AssetImage("assets/images/room_2.jpg"),
            ),
          ),
          StepSection(
            step: "0",
            titel: AppLocalizations.of(context)!.bookedStepSection10,
            text: AppLocalizations.of(context)!.bookedStepSectionText10,
            body: const Image(
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
