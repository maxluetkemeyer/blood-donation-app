import 'package:introduction_screen/introduction_screen.dart';
import 'package:rive/rive.dart';

import '../style.dart';

// Welcomepage
PageViewModel welcomePage() => PageViewModel(
      title: "Herzlich Willkommen in der Blutspende-App des UKM",
      body: "",
      //image: buildImage("assets/images/Universitätsklinikum_Münster_Logo.png"),
      image: const RiveAnimation.asset("images/blood_drop.riv"),
      decoration: getOwnPageDecoration(),
    );

