import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'testUtils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Map Group', () {
    testWidgets(
      'map integration test testing NavigationBar',
      (WidgetTester tester) async {
        await init();

        await wf.skipIntro(tester);

        await wf.clickNavMap(tester);
      },
    );
  });
}