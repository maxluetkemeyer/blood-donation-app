import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 30),
      child: Column(
        children: [
          const Image(
            image: AssetImage("assets/images/logo_transparent.png"),
          ),
          const SizedBox(height: 20),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Icon(
                      Icons.location_pin,
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const TableCell(
                    child: Text("Albert-Schweitzer-Campus 1\n48149 Münster\nDomagkstr. 11, Gebäude D11"),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Icon(
                      Icons.phone,
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TableCell(
                    child: GestureDetector(
                      onTap: () => launch('tel:+492518358000'),
                      child: const Text("Tel.: +49 251 8358000"),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Icon(
                      Icons.mail_rounded,
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TableCell(
                    child: GestureDetector(
                      onTap: () => launch("mailto:blutspende@ukmuenster.de"),
                      child: const Text("blutspende@ukmuenster.de"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
