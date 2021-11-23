import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'testUtils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Booking test', () {
    testWidgets(
      'booking integration test click through booking correctly',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavAppointments(tester);

        await wf.clickStartAppointments(tester);

        await wf.clickNoButton(tester);

        await wf.clickNoButton(tester);

        await wf.clickDate(tester);

        await wf.abortBooking(tester);

        await wf.clickStartAppointments(tester);
      },
    );
  });

  group('Booking test', () {
    testWidgets(
      'booking integration test click No buttons as many times as possible',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavAppointments(tester);

        await wf.clickStartAppointments(tester);

        final noButton = find.text('No');

        while(noButton.precache()){
          await wf.clickNoButton(tester);
          noButton.evaluate();
        }
      },
    );
  });
}
