import 'package:flutter/material.dart';

class StepSection extends StatelessWidget {
  final String step;
  final Widget body;
  final TextDirection textDirection;

  const StepSection({
    Key? key,
    required this.step,
    required this.body,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection,
      children: [
        Expanded(
          child: body,
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                step,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 200,
              width: 2,
            ),
          ],
        )
      ],
    );
  }
}
