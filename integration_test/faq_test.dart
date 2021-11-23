import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'testUtils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('FAQList Test', () {
    testWidgets(
      'Given the Application is started When pressing map on the navigationBar FAQ Then the new window pops up and works functionally (1 click)',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavFaq(tester);

        final question = find.text('Wer darf Blutspenden?');

        await tester.tap(question);

        await tester.pumpAndSettle();

        final resOneTap = find.text(
            'Entweder über den Startbildschirm oder über das Menü kann man Anmeldung auswählen. Bevor man sich einen Termin aussuchen kann, werden ein paar generelle Fragen gestellt, die eine Blutspende verhindern könnten. Sollte nach den Fragen eine Blutspende möglich kein, kann über die Kalenderfunktion ein Termin ausgewählt werden. Der Termin ist verbindlich, wenn er in der App als bestätigt gilt.');

        expect(resOneTap, findsOneWidget);
      },
    );

    testWidgets(
      'Given the Application is started When pressing map on the navigationBar FAQ Then the new window pops up and works functionally (2 clicks)',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavFaq(tester);

        final question = find.text('Wer darf Blutspenden?');

        await tester.tap(question);

        await tester.pumpAndSettle();

        final resOneTap = find.text(
            'Entweder über den Startbildschirm oder über das Menü kann man Anmeldung auswählen. Bevor man sich einen Termin aussuchen kann, werden ein paar generelle Fragen gestellt, die eine Blutspende verhindern könnten. Sollte nach den Fragen eine Blutspende möglich kein, kann über die Kalenderfunktion ein Termin ausgewählt werden. Der Termin ist verbindlich, wenn er in der App als bestätigt gilt.');

        expect(resOneTap, findsOneWidget);

        await tester.tap(question);

        await tester.pumpAndSettle();

        //expect(resTwoTap, findsNothing);
      },
    );
  });
}
