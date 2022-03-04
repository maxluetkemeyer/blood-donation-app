import 'dart:math' as math;

import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  final Color backgroundColor;
  final String status;
  final VoidCallback onTap;
  final Color textColor;

  const RequestCard({
    Key? key,
    required this.backgroundColor,
    required this.status,
    required this.onTap,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    //controller.dispose();

    super.dispose();
  }

  void onTap() {
    //animation
    controller.forward().then((_) => controller.reset());
    print("animate!");
    //some provided function
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    String appointmentTitle = "Termin:";
    String dayMonth = "11. Dezember";
    String time = "10:30";

    String statusTitle = "Status:";

    return Card(
      color: widget.backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
            left: 12,
            right: 12,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: appointmentTitle,
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
                      text: statusTitle,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: "\n" + widget.status,
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
              IconButton(
                onPressed: onTap,
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
        ),
      ),
    );
  }
}
