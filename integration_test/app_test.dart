//@dart = 2.9
import 'package:flutter/cupertino.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ukmblooddonation/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('UKMBlutSpende', (){

    testWidgets('Given the Application is started When pressing map on the navigationBar Then the new window pops up', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final button = find.byKey(ValueKey('karte'));

      await tester.tap(button);

      await tester.pumpAndSettle();

      final res = find.text('Blutspende am UKM');

      expect(res, findsOneWidget);
    });
  });
}