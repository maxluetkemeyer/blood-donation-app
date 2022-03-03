import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Navigation Test', () {


    testWidgets(
      'Given the Application is started, every tab should be accessable from every other tab',
      (WidgetTester tester) async {
        await init();
        await tester.pumpAndSettle();

        //Start -> Faq
        await wf.clickNavFaq(tester);

        //Faq -> Start
        await wf.clickNavStart(tester);

        //Start -> Appointments
        await wf.clickNavAppointments(tester);

        //Appointments -> Map
        await wf.clickNavMap(tester);

        //Map -> Appointments
        await wf.clickNavAppointments(tester);

        //Appointments -> Faq
        await wf.clickNavFaq(tester);

        //Faq -> Map
        await wf.clickNavMap(tester);

        //Map -> Start
        await wf.clickNavStart(tester);

        //Start -> Map
        await wf.clickNavMap(tester);

        //Map -> Faq
        await wf.clickNavFaq(tester);

        //Faq -> Appointments
        await wf.clickNavAppointments(tester);

        //Appointments -> Start
        await wf.clickNavStart(tester);
      },
    );
  });
}
