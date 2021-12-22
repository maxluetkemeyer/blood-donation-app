import 'package:flutter_test/flutter_test.dart';

Future<void> workflowClickDate(WidgetTester tester) async {
  //Click the 29th as Date during the current month in the booking process
  final findDate = find.text('13');

  expect(findDate, findsOneWidget);

  await tester.tap(findDate);

  await tester.pumpAndSettle();
}

Future<void> workflowClickTime(WidgetTester tester) async {
  //Click the '8:00h' time during the booking process
  //final findTime = find.byKey(const Key('0Cup'));
  final findTime = find.text("20:00");

  expect(findTime, findsWidgets);

  await tester.tap(findTime.first);

  await tester.pumpAndSettle();
}
