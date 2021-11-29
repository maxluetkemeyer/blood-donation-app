// This is supposed to be an introductionscreen ("Welcome") that greets you when you start the app,
// so that the app does not simply start with all its functions
//
// Um Introscreen zu testen bitte in der main.dart die main() Methode auskommentieren und folgendes einfügen:
// void main() => runApp(IntroScreen());
import '../home/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/link.dart';

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
          title: "Herzlich Willkommen in der UKM Blutspende App",
          body: "",
          //image: buildImage("assets/images/Universitätsklinikum_Münster_Logo.png"),
          image: const Placeholder(),
          decoration: getOwnPageDecoration()),

      // Testpage for emptywidget
      // To see widget just uncomment import empty-widget package & text below
      //
      // PageViewModel(
      //     title: "Empty-widget",
      //     body:
      //         "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
      //     image: EmptyWidget(
      //       image: null,
      //       packageImage: PackageImage.Image_2,
      //       title: "You can put your image right here",
      //     ),
      //     decoration: getOwnPageDecoration()),

      // Nice to know
      PageViewModel(
          title: "Wussten Sie...",
          bodyWidget: const Text(
            "... dass das Blutvolumen eines erwachsenen Menschen ca. 4,5 - 6,0 Liter beträgt (8% des Körpergewichtes in kg) ?\n\n... aus der Armvene werden 500ml Blut entnommen, was nur ca. 5-10 min. dauert ?\n\n... in Deutschland sind ca. 15.000 Blutspenden pro Tag erforderlich , um den täglichen Bedarf zu decken ?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, wordSpacing: 3),
            textAlign: TextAlign.justify,
          ),
          // Image from earlier version.
          // image: buildImage("assets/images/temp_blooddonation_placeholder.jpg"),
          image: const Placeholder(
            color: Color(0xff003866),
          ),
          //TODO: Link öffnen funktioniert manchmal nicht, anpassen/überprüfen
          footer: Link(
            uri:
                Uri.parse('https://ukm-blutspende.de/index.php?id=wussten-sie'),
            builder: (context, followLink) => GestureDetector(
              onTap: followLink,
              child: const Text(
                "Mehr Wissen gibt es hier",
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ),
            target: LinkTarget.self,
          ),
          decoration: getOwnPageDecoration()),

      // Blood group
      PageViewModel(
          titleWidget: const Text(
            "Blutgruppen:\nDas A-B-0 System",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff003866),
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: const Text(
            "-Mensch mit Blutgruppe A hat auf der Oberfläche seiner Blutkörperchen das Antigen A\n\n-Mensch mit Blutgruppe B hat Antigen B\n\n-Blutgruppe AB hat beide Antigene\n\n-Blugruppe 0 hat weder A noch B\n\n-Immunsystem bildet gegen fehlende Antigene Antikörper, dh ein Mensch mit Blutgruppe A hat Antikörper gegen B und umgekehrt\n\n-Bei Blutgruppe AB werden keine Antikörper gebildet\n\n-Blutgruppe 0 bildet keine Antikörper",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
          ),
          // Image from earlier version.
          //image: buildImage("assets/images/temp_blooddonation_placeholder2.jpg"),
          image: const Placeholder(
            color: Color(0xff003866),
          ),
          decoration: getOwnPageDecoration()),

      // Current information about UKM, ...
      PageViewModel(
        title: "Aktuelle Informationen zur Blutspende am UKM",
        bodyWidget: Text(
          "Für alle Blutspenden gilt die 3G-Regel.\nDas bedeutet: Zum Blutspende-Termin muss entweder ein Impfnachweis,eine Bescheinigung über Genesung oder ein Antigen-Schnelltest (nicht älter als 48 Std.) vorgelegt werden.",
          style: getOwnTextStyle(),
          textAlign: TextAlign.left,
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
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Color(0xff003866), width: 2.0))),
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
        done: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),

        // vgl. Funktion "goToHomeScreen()" unten
        onDone: () => goToHomeScreen(context),
        doneColor: const Color(0xff003866),
        onSkip: () => goToHomeScreen(context),
        showSkipButton: true,
        skip: const Text("Weiter"),
        skipColor: const Color(0xff003866),
        showNextButton: true,
        nextColor: const Color(0xff003866),
        next: const Icon(Icons.arrow_forward_ios),
        dotsDecorator: getOwnDotsDecoration(),
        onChange: (index) => print("Page $index clicked"),
        animationDuration: 1000,
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
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      activeColor: Colors.red);

  /// Get uniform Textstyle for bodyWidget inside [OnboardingView]
  TextStyle getOwnTextStyle() => const TextStyle(
      fontSize: 18,
      wordSpacing: 3,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey);

  ///Method to go to the homescreen if button was clicked. Sets "alreadyOnboarded" inside [SharedPreferences] to true
  void goToHomeScreen(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyOnboarded", true);
  }
}
