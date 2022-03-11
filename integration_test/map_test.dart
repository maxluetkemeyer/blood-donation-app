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
        await tester.pump();

        await wf.clickNavMap(tester);
        await wf.clickPanorama(tester);
      },
    );
  });
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Map Group', () {
    testWidgets(
      'Given the Application is started, when selection the map image then the user is shown the map in fullscreen',
      (WidgetTester tester) async {
        await init();

        await tester.pump();

        await wf.clickNavMap(tester);

        await tester.pump();

        await wf.clickStreetMap(tester);
      },
    );
  });
}