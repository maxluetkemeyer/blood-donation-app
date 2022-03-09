import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, when a name is set it is saved',
      (WidgetTester tester) async {
        //leaving the user data menu and reopening it
        await init();
        await tester.pumpAndSettle();
      },
    );
  });
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, the saved name can be changed by a user',
      (WidgetTester tester) async {
        await init();
        await tester.pumpAndSettle();
      },
    );
  });
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, the saved birthday can be changed by a user',
      (WidgetTester tester) async {
        await init();
        await tester.pumpAndSettle();
      },
    );
  });
  group('User Data Group', () {
    testWidgets(
      'Given the Application is started, the saved date of the last donation can be changed by a user',
      (WidgetTester tester) async {
        await init();
        await tester.pumpAndSettle();
      },
    );
  });
}
