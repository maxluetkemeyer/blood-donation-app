import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'testUtils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Booking Group 1', () {
    testWidgets(
      'booking integration test 1',
      (WidgetTester tester) async {
        init();

        //Skip Intro
        await wf.skipIntro(tester);

        await wf.clickNavAppointments(tester);

        await wf.clickStartAppointments(tester);

        final noButton = find.text('No');

        expect(noButton, findsOneWidget);
      },
    );
  });

  group('Booking Group 1', () {
    testWidgets(
      'booking integration test 1',
      (WidgetTester tester) async {
        init();

        //Skip Intro
        await wf.skipIntro(tester);

        await wf.clickNavAppointments(tester);

        await wf.clickStartAppointments(tester);

        final noButton = find.text('No');

        expect(noButton, findsOneWidget);
      },
    );
  });
}
