///TODO: New structure with link to backend

// This is supposed to be an introductionscreen ("Welcome") that greets you when you start the app,
// so that the app does not simply start with all its functions
//
// Um Introscreen zu testen bitte in der main.dart die main() Methode auskommentieren und folgendes einfügen:
// void main() => runApp(IntroScreen());
import '../app.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/link.dart';
import 'package:rive/rive.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  /// List of pages which are shown in [OnboardingView]
  ///
  ///returns [List] of [PageViewModel]'s
  List<PageViewModel> getPages(BuildContext context) {
    return [
      // If you get an error message when you add multiple pages, adjust the (active-)size of the navigation points in the getOwnDotsDecoration() method

      // Welcomepage
      PageViewModel(
        title: "Herzlich Willkommen in der Blutspende-App des UKM",
        body: "",
        //image: buildImage("assets/images/Universitätsklinikum_Münster_Logo.png"),
        image: const RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
        ),
        decoration: getOwnPageDecoration(),
      ),

      PageViewModel(
        title: "Wussten Sie..",
        bodyWidget: const Text(
          "..dass in Deutschland täglich über 15.000 Blutspenden benötigt werden?\n\n..dass eine einzelne Blutspende bis zu drei Leben retten kann?\n\n..dass der menschliche Körper ca. fünf Liter Blut enthält?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, wordSpacing: 3),
          textAlign: TextAlign.justify,
        ),
        // Image from earlier version.
        // image: buildImage("assets/images/temp_blooddonation_placeholder.jpg"),
        image: const Placeholder(
          color: Color(0xff003866),
        ),
        //TODO: Link öffnen funktioniert manchmal nicht, anpassen/überprüfen
        footer: Link(
          uri: Uri.parse('https://ukm-blutspende.de/index.php?id=wussten-sie'),
          builder: (context, followLink) => GestureDetector(
            onTap: followLink,
            child: const Text(
              "Mehr Informationen finden Sie hier",
              style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),
            ),
          ),
          target: LinkTarget.self,
        ),
        decoration: getOwnPageDecoration(),
      ),

      // Blood group
      PageViewModel(
        titleWidget: const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            "Mit einem Bruchteil Ihrer Zeit..",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff003866),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text(
            "also etwa eine gute Stunde – mehr Zeit müssen Sie nicht mitbringen. Die Blutspende selbst dauert beispielsweise bei einer Vollblutspende nur maximal 12 Minuten. Die Voruntersuchung, das Ausfüllen des Fragebogens und das anschließende Ausruhen brauchen aber auch etwas Zeit.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
             textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Text(
          "..retten Sie vielleicht ein ganzes Leben.",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff003866)),
          textAlign: TextAlign.center,
          ),
          ],
        ),
        // Image from earlier version.
        //image: buildImage("assets/images/temp_blooddonation_placeholder2.jpg"),
        decoration: getOwnPageDecoration(),
        footer: const Text(
          "Alles in allem für Sie kaum mehr als ein Augenblick, der für einen schwer erkrankten oder verletzten Menschen jedoch das Leben bedeuten kann.",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
         textAlign: TextAlign.center,
        ),

      )
      ,

      // Current information about UKM, ...
      PageViewModel(
        title: "Aktuelle Informationen zur Blutspende am UKM",
        bodyWidget: const Text(
          "Für alle Blutspender:innen gilt die 3G-Regel.\nDas bedeutet: Zum Blutspende-Termin muss entweder ein Impfnachweis, eine Bescheinigung über Genesung oder ein Antigen-Schnelltest (nicht älter als 48 Std.) vorgelegt werden.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
          textAlign: TextAlign.center,
        ),
        // Image from earlier version.
        // image: Center(
        //   child: Image.asset(
        //     "assets/images/temp_3G_placeholder.jpg",
        //     width: 500,
        //   ),
        // ),
        image: const Placeholder(),
        decoration: getOwnPageDecoration(),
        footer: ElevatedButton(
          onPressed: () => goToHomeScreen(context),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Color(0xff003866), width: 2.0))),
              backgroundColor: MaterialStateProperty.all(const Color(0xff003866))),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 100, minHeight: 25),
            alignment: Alignment.center,
            child: const Text(
              "Starte App",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    ];
  }

  ///Build method for the [OnboardingView]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getPages(context),
        done: const Text(
          '',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        // vgl. Funktion "goToHomeScreen()" unten
        onDone: () => goToHomeScreen(context),
        doneColor: const Color(0xff003866),
        onSkip: () => goToHomeScreen(context),
        skipColor: const Color(0xff003866),
        showNextButton: true,
        nextColor: const Color(0xff003866),
        next: const Icon(Icons.arrow_forward_ios),
        dotsDecorator: getOwnDotsDecoration(),
        onChange: (index) => print("Page $index clicked"),
        animationDuration: 1000,
        color: const Color(0xff003866),
      ),
    );
  }

  /// Import images with fixed size by setting the asset [path]
  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 250,
          height: 250,
        ),
      );

  /// Get uniform decoration for pages in inside [OnboardingView]
  PageDecoration getOwnPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xff003866),
        ),
        bodyTextStyle: const TextStyle(fontSize: 20),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
        pageColor: Colors.white,
      );

  /// Get uniform decoration for Dots inside [OnboardingView]
  DotsDecorator getOwnDotsDecoration() => DotsDecorator(
        color: const Color(0xff003866),
        size: const Size(5, 5),
        activeSize: const Size(11, 5),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        activeColor: const Color(0xff003866),
      );

  /// Get uniform Textstyle for bodyWidget inside [OnboardingView]
  TextStyle getOwnTextStyle() => const TextStyle(fontSize: 18, wordSpacing: 3, fontWeight: FontWeight.bold, color: Colors.blueGrey);

  ///Method to go to the homescreen if button was clicked. Sets "alreadyOnboarded" inside [SharedPreferences] to true
  void goToHomeScreen(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const AppStructure(),
        ),
        (Route<dynamic> route) => false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyOnboarded", true);
  }
}
