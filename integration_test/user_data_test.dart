import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, the saved name can be changed by a user',
      (WidgetTester tester) async {
        await init();

        await tester.pump();

        await wf.clickPopUpNav(tester);

        await tester.pump();

        await wf.clickNavUserData(tester);

        await tester.pump();

        await wf.testNameVorname(tester);

        await wf.testNameNachname(tester);

        await wf.testNameZwischenname(tester);

        await wf.testNameSonderzeichen(tester);

        await wf.testNameDoppelname(tester);
      },
    );
  });
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, the gender can be changed by a user',
      (WidgetTester tester) async {
        await init();
        
        await tester.pump();

        await wf.clickPopUpNav(tester);

        await tester.pump();

        await wf.clickNavUserData(tester);

        await tester.pump();

        await wf.testGenderM(tester);

        await wf.testGenderW(tester);

        await wf.testGenderD(tester);

        await wf.testGenderMannlich(tester);

        await wf.testGenderWeiblich(tester);

        await wf.testGenderDivers(tester);
      },
    );
  });
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, the telephone can be changed by a user',
      (WidgetTester tester) async {
        await init();

        await tester.pump();

        await wf.clickPopUpNav(tester);

        await tester.pump();

        await wf.clickNavUserData(tester);

        await tester.pump();

        await wf.testNumbers(tester);

        await wf.testNumberSame(tester);

        await wf.testNumberSlash(tester);

        await wf.testNumberDoppel(tester);
      },
    );
  });
}
