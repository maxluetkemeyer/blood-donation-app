import 'dart:math' as math;

import 'package:blooddonation/models/appointment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class RequestCard extends StatefulWidget {
  final Color backgroundColor;
  final Appointment appointment;
  final VoidCallback onRefresh;
  final VoidCallback onCancel;
  final Color textColor;

  const RequestCard({
    Key? key,
    required this.backgroundColor,
    required this.appointment,
    required this.onRefresh,
    required this.onCancel,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void refreshIcon() {
    //animation
    controller.forward().then((_) => controller.reset());
    print("animate!");
    //some provided function
    widget.onRefresh();
  }

  void deleteIcon() async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          "Termin stornieren?",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        content: Column(
          children: const [
            SizedBox(height: 10),
            Text(
              "Diese Aktion kann nicht rückgängig gemacht werden!",
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: [
          CupertinoDialogAction(
            key: const ValueKey('cancelBookingComp'),
            isDestructiveAction: true,
            onPressed: widget.onCancel,
            child: const Text("Termin stornieren"),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.back),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dayMonth = DateFormat("c. LLLL").format(widget.appointment.start); //"11. Dezember";
    String time = DateFormat("hh:mm").format(widget.appointment.start); //"10:30";

    return Card(
      color: widget.backgroundColor,
      child: InkWell(
        onTap: refreshIcon,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
            left: 12,
            right: 12,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Termin:",
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: "\n" + dayMonth,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: "\n" + time,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: "Status:",
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: "\n" + widget.appointment.request!.status,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: deleteIcon,
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      size: 30,
                      color: widget.textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: refreshIcon,
                    icon: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: (1 - controller.value) * 2.0 * math.pi,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.replay_outlined,
                        size: 30,
                        color: widget.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
