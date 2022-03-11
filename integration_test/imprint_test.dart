import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import './workflows/workflows.dart' as wf;
import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Imprint Test', () {
    testWidgets(
      'Given the Application is started, When pressing the additional menu and selected imprint, then the imprint is shown',
      (WidgetTester tester) async {
        await init();

        await tester.pump();

        await wf.clickPopUpNav(tester);
        
        await tester.pump();

        await wf.clickNavImprint(tester);

        await tester.pump();
        final imprintText = find.textContaining('ERCIS');
        expect(imprintText, findsOneWidget);
      },
    );
  });
}
