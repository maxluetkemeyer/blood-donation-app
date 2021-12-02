import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('FAQList Test', () {
    testWidgets(
      'Given the Application is started When pressing map on the navigationBar FAQ Then the new window pops up and works functionally (1 click)',
      (WidgetTester tester) async {
        await init();

        //await wf.skipIntro(tester);
        await tester.pumpAndSettle();

        await wf.clickNavFaq(tester);

        final question = find.text("Darf ich Blut spenden?");

        await tester.tap(question);

        await tester.pumpAndSettle();

        final resOneTap = find.text(
            'Um Blut spenden zu können müssen Sie zwischen 18 und 68 Jahre alt und völlig gesund sein. Erstspender müssen dabei unter 60 Jahre alt sein. Sie sollten mindestens 50kg wiegen und dürfen keine bestehenden Grunderkrankungen (wie z. B. Diabetes, Bluthochdruck, Herzkrankheiten, Autoimmunerkrankungen, Epilepsie usw.) oder Tumorkrankheiten haben. Sie dürfen nicht regelmäßig Medikamente (außer Hormonpräparate) einnehmen, schwanger sein oder stillen. Sie dürfen in den letzten vier Monaten nicht gepierct oder tätowiert worden sein und Sie dürfen kein Piercing im Mund- oder Intimbereich haben.');

        expect(resOneTap, findsOneWidget);
      },
    );

    testWidgets(
      'Given the Application is started When pressing map on the navigationBar FAQ Then the new window pops up and works functionally (2 clicks)',
      (WidgetTester tester) async {
        await init();

        //await wf.skipIntro(tester);
        await tester.pumpAndSettle();

        await wf.clickNavFaq(tester);

        final question = find.text("Darf ich Blut spenden?");

        await tester.tap(question);

        await tester.pumpAndSettle();

        final resOneTap = find.text(
            'Um Blut spenden zu können müssen Sie zwischen 18 und 68 Jahre alt und völlig gesund sein. Erstspender müssen dabei unter 60 Jahre alt sein. Sie sollten mindestens 50kg wiegen und dürfen keine bestehenden Grunderkrankungen (wie z. B. Diabetes, Bluthochdruck, Herzkrankheiten, Autoimmunerkrankungen, Epilepsie usw.) oder Tumorkrankheiten haben. Sie dürfen nicht regelmäßig Medikamente (außer Hormonpräparate) einnehmen, schwanger sein oder stillen. Sie dürfen in den letzten vier Monaten nicht gepierct oder tätowiert worden sein und Sie dürfen kein Piercing im Mund- oder Intimbereich haben.');

        expect(resOneTap, findsOneWidget);

        await tester.tap(question);

        await tester.pumpAndSettle();

        //expect(resTwoTap, findsNothing);
      },
    );
  });
}
