import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Map Group', () {
    testWidgets(
      'map integration test testing connection to Google Maps',
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
      'map integration test testing the 360° image',
      (WidgetTester tester) async {
        await init();

        //await wf.skipIntro(tester);
        await tester.pumpAndSettle();

        await wf.clickNavMap(tester);
      },
    );
  });
}