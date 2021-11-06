import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'testUtils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Booking test', () {
    testWidgets(
      'booking integration test click no two times',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavAppointments(tester);

        await wf.clickStartAppointments(tester);

        await wf.clickNoButton(tester);

        

        await wf.clickNoButton(tester);

        await wf.abortBooking(tester);

        await wf.clickStartAppointments(tester);
      },
    );
  });

  group('Booking test', () {
    testWidgets(
      'booking integration test 1',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavAppointments(tester);

        await wf.clickStartAppointments(tester);

        final noButton = find.text('No');

        expect(noButton, findsOneWidget);
      },
    );
  });
}
