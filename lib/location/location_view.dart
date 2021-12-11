import 'package:blooddonation/misc/env.dart' as env;
import 'package:blooddonation/location/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  ///[TextStyle] for contact and routing to the blood donation location.
  final TextStyle contactData = const TextStyle(
    fontSize: 15,
  );

  ///Build method to give the user contact information and routing information.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 300,
            child: MyMap(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.mapHeading,
                style: const TextStyle(
                  color: Color(0xff003866),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //UKM Image
              const SizedBox(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage("assets/images/Universitätsklinikum_Münster_Logo.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: InkWell(
                      child: Text(
                        "Albert-Schweitzer-Campus 1\n48149 Münster\n\n" +
                            AppLocalizations.of(context)!.mapDirections +
                            ":\nDomagkstr. 11, Gebäude D11",
                        style: contactData,
                      ),
                      onTap: () => launch(env.locationLink),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: InkWell(
                      child: Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(width: 10),
                          Text(
                            "Tel.: +49 251 8358000",
                            style: contactData,
                          ),
                        ],
                      ),
                      onTap: () => launch('tel:+492518358000'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Text("blutspende@­ukmuenster.de", style: contactData),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Image(
            image: AssetImage("assets/images/UKM_Blutspende_Muenster_Eingang.jpg"),
          ),
        ],
      ),
    );
  }
}
