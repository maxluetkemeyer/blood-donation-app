import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  TableCell(
                    child: Text(AppLocalizations.of(context)!.institutionAdress),
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
                      onTap: () => launchUrl(Uri.dataFromString('tel:+492518358000')),
                      child: Text(AppLocalizations.of(context)!.institutionTelephoneNumber),
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
                      onTap: () => launchUrl(Uri.parse("mailto:blutspende@ukmuenster.de")),
                      child: Text(AppLocalizations.of(context)!.institutionMailAdress),
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
