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
        //All tests fail, due to the method pumpAndSettle can not be combined with Riverpod
        //Here are some trys to replace it with delays
        print("Test_start");

        await init();

        await tester.pump();

        await wf.clickPopUpNav(tester);
        
        //await Future.delayed(const Duration(seconds: 10));
        //await tester.pump(const Duration(seconds: 15));
        for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(seconds: 1));
        }
        print("Delay_Done");
        await wf.clickNavImprint(tester);
        
        for (int i = 0; i < 10; i++) {
        await Future.delayed(const Duration(seconds: 10));
        }
        final imprintText = find.textContaining('Angaben');
        expect(imprintText, findsOneWidget);



        /*await tester.pumpAndSettle();
        print("pump1Done");
        //Test für User Data
        await init();
        print("initDone");
        await tester.pump();
        print("finalSettle");
        
        await wf.clickNavStart(tester);
        print("NavStartDone");
        
            const listSize = 10;
             const listFilling = 7;
              final list = await tester.runAsync(() async => 
             await Future.delayed(const Duration(milliseconds: 100), 
            () => List<int>.filled(listSize, listFilling)));

              expect(10, listSize);
        


        print("delay_started");
        await Future.delayed(const Duration(seconds: 10));
        print("delay_ended");

        print("pump_started");
        await tester.pump(const Duration(seconds: 15));
        print("pump_ended");

        await tester.pump();

        print("PUMPSTART");
        for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(seconds: 1));
        }
        print("PUMPDONE");

        await wf.clickNavFaq(tester);
        print("DONE");*/

        //await wf.clickNavUserData(tester);

        //final userDataText = find.textContaining("Name");
        //expect(userDataText, findsOneWidget);
        //user data overview

        //final userDataText = find.("Name");
        
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
