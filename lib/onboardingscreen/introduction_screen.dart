// This is supposed to be an introductionscreen ("Welcome") that greets you when you start the app,
// so that the app does not simply start with all its functions
//
// Um Introscreen zu testen bitte in der main.dart die main() Methode auskommentieren und folgendes einfügen:
// void main() => runApp(IntroScreen());
import 'package:blooddonation/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/link.dart';

class IntroScreen extends StatelessWidget {
  // List of pages which are shown in introductionscreen
  //TODO: Bilder, die benutzt werden sollen zu assets hinzufügen
  List<PageViewModel> getPages(BuildContext context) {
    return [
      // Welcomepage
      PageViewModel(
          title: "Herzlich Willkommen in der UKM Blutspende App",
          body: "",
          image:
              buildImage("assets/images/Universitätsklinikum_Münster_Logo.png"),
          decoration: getOwnPageDecoration()),

      // Nice to know
      PageViewModel(
          title: "Wussten Sie...",
          bodyWidget: Text(
            "... dass das Blutvolumen eines erwachsenen Menschen ca. 4,5 - 6,0 Liter beträgt (8% des Körpergewichtes in kg) ?\n\n... aus der Armvene werden 500ml Blut entnommen, was nur ca. 5-10 min. dauert ?\n\n... in Deutschland sind 15.000 Blutspenden pro Tag erforderlich, um den täglichen Bedarf zu decken ?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, wordSpacing: 3),
            textAlign: TextAlign.justify,
          ),
          //TODO: verwendetes Bild zu assets hinzufügen
          image: Image.network(
              "https://media.istockphoto.com/vectors/blood-donation-transfusion-vector-cartoon-illustration-volunteer-male-vector-id1159682984?k=20&m=1159682984&s=612x612&w=0&h=3X4pTHyovnAXotv1ipA9LecJ6xbnmpXRTsC7cKAsMdc="),
          //TODO: Link öffnen funktioniert manchmal nicht, anpassen/überprüfen
          footer: Link(
            uri:
                Uri.parse('https://ukm-blutspende.de/index.php?id=wussten-sie'),
            builder: (context, followLink) => GestureDetector(
              onTap: followLink,
              child: Text(
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
          titleWidget: Text(
            "Blutgruppen:\nDas A-B-0 System",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff003866),
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: Text(
            "-Mensch mit Blutgruppe A hat hat auf der Oberfläche seiner Blutkörperchen das Antigen A\n\n-Mensch mit Blutgruppe B hat Antigen B\n\n-Blutgruppe AB hat beide Antigene\n\n-Blugruppe 0 hat weder A noch B\n\n-Immunsystem bildet gegen fehlende Antigene Antikörper, dh ein Mensch mit Blutgruppe A hat Antikörper gegen B und umgekehrt\n\n-Bei Blutgruppe AB werden keine Antikörper gebildet\n\n-Blutgruppe 0 bildet keine Antikörper",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
          ),
          //TODO: verwendetes Bild zu assets hinzufügen
          image: Image.network(
              "https://img.graphicsurf.com/2020/08/blood-donation-vector-illustration.jpg"),
          decoration: getOwnPageDecoration()),

      // Current information about UKM, ...
      PageViewModel(
        title: "Aktuelle Informationen zur Blutspende am UKM",
        bodyWidget: Text(
          "Für alle Blutspenden gilt die 3G-Regel.\nDas bedeutet: Zum Blutspende-Termin muss entweder ein Impfnachweis,eine Bescheiigung über Genesung oder ein Antigen-Schnalltest (nicht äter als 48 Std.) vorgelegt werden.",
          style: getOwnTextStyle(),
          textAlign: TextAlign.left,
        ),
        //TODO: verwendetes Bild zu assets hinzufügen
        image: Center(
          child: Image.network(
            "https://www.kino-wolfratshausen.de/images/news/92580_0_big.jpg",
            width: 500,
          ),
        ),
        decoration: getOwnPageDecoration(),
        footer: ElevatedButton(
          onPressed: () => goToHomeScreen(context),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xff003866), width: 2.0))),
              backgroundColor: MaterialStateProperty.all(Color(0xff003866))),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100, minHeight: 25),
            alignment: Alignment.center,
            child: Text(
              "Starte App",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getPages(context),
        done: Text('', style: TextStyle(fontWeight: FontWeight.w600)),

        //TODO: Button so anpassen, dass man zur Startseite der App gelangt
        // vgl. Funktion "goToHomeScreen()" unten
        onDone: () => goToHomeScreen(context),
        doneColor: Color(0xff003866),

        //TODO: Button so anpassen, dass man nicht zur letzten Seite springt sondern direkt auf die Startseite der App
        onSkip: () => goToHomeScreen(context),

        showSkipButton: true,
        skip: Text("Weiter"),
        skipColor: Color(0xff003866),
        showNextButton: true,
        nextColor: Color(0xff003866),
        next: Icon(Icons.arrow_forward_ios),
        dotsDecorator: getOwnDotsDecoration(),
        onChange: (index) => print("Page $index clicked"),
        animationDuration: 1000,
      ),
    );
  }

  // Import images with fixed size
  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 250,
          height: 250,
        ),
      );

  // Get uniform decoration for pages in introductionscreen
  PageDecoration getOwnPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xff003866),
        ),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        pageColor: Colors.white,
      );

  // Get uniform decoration for Dots
  DotsDecorator getOwnDotsDecoration() => DotsDecorator(
      color: Color(0xff003866),
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      activeColor: Colors.red);

  // Get uniform Textstyle for bodyWidget
  TextStyle getOwnTextStyle() => TextStyle(
      fontSize: 18,
      wordSpacing: 3,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey);

  // Method to go to the homescreen if button was clicked
  void goToHomeScreen(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeView()),
        (Route<dynamic> route) => false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyOnboarded", true);
  }
}
