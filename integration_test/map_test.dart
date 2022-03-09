import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Map Group', () {
    testWidgets(
      'Given the Application is started, when selecting the 360 degree image then it is shown in fullscreen',
      (WidgetTester tester) async {
        await init();

        //await wf.skipIntro(tester);
        await tester.pumpAndSettle();

        await wf.clickNavMap(tester);
      },
    );
  });
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Map Group', () {
    testWidgets(
      'Given the Application is started, when selection the map image (twice) then the user gets to open (Google) Maps with a set destination',
      (WidgetTester tester) async {
        await init();

        //await wf.skipIntro(tester);
        await tester.pumpAndSettle();

        await wf.clickNavMap(tester);
      },
    );
  });
}