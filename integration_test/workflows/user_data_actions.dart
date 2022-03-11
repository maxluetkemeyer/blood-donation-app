import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> workflowTestNameVorname(WidgetTester tester) async{
  //Enters and checks the name "Vorname" in the nameField
  final nameField = find.byKey(const ValueKey("nameField"));

  expect(nameField, findsOneWidget);

  await tester.tap(nameField);

  await tester.pump();

  await tester.enterText(nameField, "Vorname");

  await tester.pump();

  await tester.testTextInput.receiveAction(TextInputAction.done);

  await tester.pump();

  final name1 = find.textContaining("Vorname");

  expect(name1, findsOneWidget);

  print("VornameViable");

  Future.delayed(const Duration(seconds: 3));

  return;
}

Future<void> workflowTestNameVornameNachname(WidgetTester tester) async{
  //Enters and checks the name "Vorname Nachname" in the nameField
  final nameField = find.byKey(const ValueKey("nameField"));

  expect(nameField, findsOneWidget);

  await tester.tap(nameField);

  await tester.pump();

  await tester.enterText(nameField, "Vorname Nachname");

  await tester.pump();

  await tester.testTextInput.receiveAction(TextInputAction.done);

  await tester.pump();

  final name1 = find.textContaining("Vorname Nachname");

  expect(name1, findsOneWidget);

  print("VornameNachnameViable");

  Future.delayed(const Duration(seconds: 3));

  return;
}

Future<void> workflowTestNameVornameZwischennameNachname(WidgetTester tester) async{
  //Enters and checks the name "Vorname Zwischenname Nachname" in the nameField
  final nameField = find.byKey(const ValueKey("nameField"));

  expect(nameField, findsOneWidget);

  await tester.tap(nameField);

  await tester.pump();

  await tester.enterText(nameField, "Vorname Zwischenname Nachname");

  await tester.pump();

  await tester.testTextInput.receiveAction(TextInputAction.done);

  await tester.pump();

  final name1 = find.textContaining("Vorname Zwischenname Nachname");

  expect(name1, findsOneWidget);

  print("VornameZwischennameNachnameViable");

  Future.delayed(const Duration(seconds: 3));

  return;
}

Future<void> workflowTestNameSonderzeichenNachname(WidgetTester tester) async{
  //Enters and checks the name "Sönderzeichen Nachname" in the nameField
  final nameField = find.byKey(const ValueKey("nameField"));

  expect(nameField, findsOneWidget);

  await tester.tap(nameField);

  await tester.pump();

  await tester.enterText(nameField, "Sönderzeichen Nachname");

  await tester.pump();

  await tester.testTextInput.receiveAction(TextInputAction.done);

  await tester.pump();

  final name1 = find.textContaining("Sönderzeichen Nachname");

  expect(name1, findsOneWidget);

  print("SondernameNachnameViable");

  Future.delayed(const Duration(seconds: 3));

  return;
}

Future<void> workflowTestDoppelnameNachname(WidgetTester tester) async{
  //Enters and checks the name "Doppel-Name Nachname" in the nameField
  final nameField = find.byKey(const ValueKey("nameField"));

  expect(nameField, findsOneWidget);

  await tester.tap(nameField);

  await tester.pump();

  await tester.enterText(nameField, "Doppel-Name Nachname");

  await tester.pump();

  await tester.testTextInput.receiveAction(TextInputAction.done);

  await tester.pump();

  final name1 = find.textContaining("Doppel-Name Nachname");

  expect(name1, findsOneWidget);

  print("Doppel-NameNachnameViable");

  Future.delayed(const Duration(seconds: 3));

  return;
}

Future<void> workflowTestGenderm(WidgetTester tester) async{
  //Enters and checks the gender "m" in the genderField
  final genderField = find.byKey(const ValueKey("genderField"));
  expect(genderField, findsOneWidget);
  await tester.tap(genderField);
  await tester.pump();
  await tester.enterText(genderField, "m");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  print("mViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestGenderw(WidgetTester tester) async{
 //Enters and checks the gender "w" in the genderField
  final genderField = find.byKey(const ValueKey("genderField"));
  expect(genderField, findsOneWidget);
  await tester.tap(genderField);
  await tester.pump();
  await tester.enterText(genderField, "w");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  print("wViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestGenderd(WidgetTester tester) async{
  //Enters and checks the gender "d" in the genderField
  final genderField = find.byKey(const ValueKey("genderField"));
  expect(genderField, findsOneWidget);
  await tester.tap(genderField);
  await tester.pump();
  await tester.enterText(genderField, "d");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  print("dViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestGendermannlich(WidgetTester tester) async{
  //Enters and checks the gender "männlich" in the genderField
  final genderField = find.byKey(const ValueKey("genderField"));
  expect(genderField, findsOneWidget);
  await tester.tap(genderField);
  await tester.pump();
  await tester.enterText(genderField, "männlich");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final gender1 = find.textContaining("männlich");
  expect(gender1, findsOneWidget);
  print("männlichViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestGenderweiblich(WidgetTester tester) async{
  //Enters and checks the gender "weiblich" in the genderField
  final genderField = find.byKey(const ValueKey("genderField"));
  expect(genderField, findsOneWidget);
  await tester.tap(genderField);
  await tester.pump();
  await tester.enterText(genderField, "weiblich");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final gender1 = find.textContaining("weiblich");
  expect(gender1, findsOneWidget);
  print("weiblichViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestGenderdivers(WidgetTester tester) async{
  //Enters and checks the gender "divers" in the genderField
  final genderField = find.byKey(const ValueKey("genderField"));
  expect(genderField, findsOneWidget);
  await tester.tap(genderField);
  await tester.pump();
  await tester.enterText(genderField, "divers");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final gender1 = find.textContaining("divers");
  expect(gender1, findsOneWidget);
  print("diversViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestNumbers(WidgetTester tester) async{
  //Enters and checks the number "0123456789" in the telephoneField
  final telephoneField = find.byKey(const ValueKey("telephoneField"));
  expect(telephoneField, findsOneWidget);
  await tester.tap(telephoneField);
  await tester.pump();
  await tester.enterText(telephoneField, "0123456789");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final number1 = find.textContaining("0123456789");
  expect(number1, findsOneWidget);
  print("NumbersViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestNumberSame(WidgetTester tester) async{
  //Enters and checks the number "5555555555" in the telephoneField
  final telephoneField = find.byKey(const ValueKey("telephoneField"));
  expect(telephoneField, findsOneWidget);
  await tester.tap(telephoneField);
  await tester.pump();
  await tester.enterText(telephoneField, "5555555555");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final number1 = find.textContaining("5555555555");
  expect(number1, findsOneWidget);
  print("SameNumberViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestNumberSlash(WidgetTester tester) async{
  //Enters and checks the number "0000/11111" in the telephoneField
  final telephoneField = find.byKey(const ValueKey("telephoneField"));
  expect(telephoneField, findsOneWidget);
  await tester.tap(telephoneField);
  await tester.pump();
  await tester.enterText(telephoneField, "0000/11111");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final number1 = find.textContaining("0000/11111");
  expect(number1, findsOneWidget);
  print("slashViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

Future<void> workflowTestNumberDoppel(WidgetTester tester) async{
  //Enters and checks the number "2222-55555" in the telephoneField
  final telephoneField = find.byKey(const ValueKey("telephoneField"));
  expect(telephoneField, findsOneWidget);
  await tester.tap(telephoneField);
  await tester.pump();
  await tester.enterText(telephoneField, "2222-55555");
  await tester.pump();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  final number1 = find.textContaining("2222-55555");
  expect(number1, findsOneWidget);
  print("doppelNummerViable");
  Future.delayed(const Duration(seconds: 3));
  return;
}

