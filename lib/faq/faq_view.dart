import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faq"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ExpansionTile(
              title: Text(
                  'Wie mache ich einen Termin zum Blutspenden in dieser App ab?'),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '[Anwendung der App]',
                  ),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('Warum sollte ich Blut spenden?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Blutspenden sichern die Versorgung von Patienten während Operationen und Therapien, somit rettet gespendetes Blut Leben.')),
              ],
            ),
            const ExpansionTile(
              title: Text('Was muss ich als Erstspender beachten?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Erstspender bekommen von uns einen umfangreichen Fragebogen ausgehändigt, um Ihre Krankengeschichte und eventuelle Ausschlusskriterien für eine Spende zu erfassen')),
                ListTile(
                    title: Text(
                        'Damit Sie mit einen sicheren Gefühl zu Ihrer ersten Blutspende gehen können, legen wir besonderen Wert darauf, dass ein Erstspender umfassend informiert wird, Fragen beantworten wir gerne im Arztgespräch')),
              ],
            ),
            const ExpansionTile(
              title: Text('Was muss ich vor einer Blutspende beachten?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Vor der Spende solltest du ausreichend gegessen und mindestens 1,5 Liter alkoholfreie Flüssigkeit zu sich genommen haben. Nicht mit nüchternem Magen zum Blutspendetermin kommen!')),
              ],
            ),
            const ExpansionTile(
              title: Text('Wer darf Blutspenden?'),
              children: <Widget>[
                ListTile(title: Text('blabla')),
              ],
            ),
            const ExpansionTile(
              title: Text('Wie verläuft eine Blutspende?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Nach der Anmeldung zu der Blutspende muss vor Ort ein Fragebogen ausgefüllt werden. Vor der Spende wird die Konzentration des Hämoglobins im Blut geprüft. Nach einem Arztgespräch, bei dem der Gesundheitszustand der Spender:innen abgefragt wird, kann Blut gespendet werden. Eine Blutspende benötigt maximal 12 Minuten. Die Einzelspende hat ein Volumen von ca 450 ml Blut. Nach der Spende sollten noch ca. 30 Minuten im Wartezimmer verbracht werden, um Kreislaufreaktionen zu vermeiden. Dazu gibt es Getränke, einen Imbiss und eine Aufwandsentschädigung.')),
              ],
            ),
            const ExpansionTile(
              title: Text('Was passiert mit dem gespendeten Blut?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'blablakhfksdhfjhf ndknhfkdfdkfjdslfjf jkfjdskfjkdjfksdjfkdsfj jfkjkfdskfjdskfjdskf kndfkjdskfjdskfjdskfjdskf kjfkdsjfkdsjfkdsjfkdfjdksf kjfkdsjfkdsjfkdsjfkdsfjkdsfj kdjfkdsjfkdsjfkdsjf')),
                ListTile(title: Text('lol')),
              ],
            ),
            const ExpansionTile(
              title: Text('Was gibt es für Aufwandsentschädigung?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Erstspende-10,00 €, ab der 2.-20,00 €, bei der 3. im Kalenderjahr einmalig-30,00 €')),
              ],
            ),
            const ExpansionTile(
              title: Text('Was gibt es für Risiken?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Für die Blutentnahme wird ausschließlich steriles Einwegmaterial verwendet. Eine Ansteckungsgefahr ist für Sie somit ausgeschlossen. Die Blutspende selbst wird im Allgemeinen gut vertragen; trotzdem sollten Sie sich am Spendetag nicht vermehrter körperlicher Belastung aussetzen. ')),
              ],
            ),
            const ExpansionTile(
              title: Text('Wie oft darf man Blut spenden?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Frauen dürfen alle zwölf Wochen, jedoch maximal vier Mal im Jahr, zur Vollblutspende gehen. Männer dürfen alle acht Wochen, jedoch maximal sechs Mal im Jahr, zur Vollblutspende gehen.')),
              ],
            ),
            const ExpansionTile(
              title: Text('Warum wird meine Blutgruppe gespeichert?'),
              children: <Widget>[
                ListTile(title: Text('niemand')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
