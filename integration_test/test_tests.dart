import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Test Group', () {
    testWidgets(
      'Test file for integrations tests',
      (WidgetTester tester) async {
        
        await tester.pumpAndSettle();
        
        //Test für User Data
        await init();

        await tester.pumpAndSettle();

        await wf.clickPopUpNav(tester);

        final navUserData = find.byKey(const Key('userDataButton'));

        expect(navUserData, findsOneWidget);

        await tester.tap(navUserData);

        await tester.pumpAndSettle();
        //user data overview



        //final userDataText = find.textContaining('name');
        //expect(userDataText, findsOneWidget);


        //final imprintDots = find.byKey(const Key('popUpDots'));
        //expect(imprintDots, findsOneWidget);
        //await tester.tap(imprintDots);

        //await tester.pumpAndSettle();

 

        //await wf.clickNavMap(tester);
        //await wf.clickNavAppointments(tester);
        //await wf.clickNavStart(tester);

        //'TODO Imprint Back Button'
        //'FAQ Questions'
      },
    );
  });
}
