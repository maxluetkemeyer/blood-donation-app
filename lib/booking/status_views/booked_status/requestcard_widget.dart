import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final Color backgroundColor;
  final String status;
  final VoidCallback onTapFooter;

  const RequestCard({
    Key? key,
    required this.backgroundColor,
    required this.status,
    required this.onTapFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
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
                  children: [
                    const Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      status,
                      style: const TextStyle(
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
                icon: const Text("Dein Blutspendetermin am UKM"),
                onPressed: onTapFooter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
