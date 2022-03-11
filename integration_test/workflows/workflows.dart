// ignore_for_file: library_prefixes, prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';

import 'skip_intro.dart' as skipIntroAS;
import 'click_nav.dart' as clickNavAS;
import 'click_buttons.dart' as clickButtonsAS;
import 'abort_booking.dart' as abortBookingAS;
import 'booking_actions.dart' as bookingActionsAS;
import "map_actions.dart" as mapActionsAS;
import "user_data_actions.dart" as userDataActionsAS;

//Skipping Introduction
final skipIntro = (WidgetTester tester) => skipIntroAS.workflow(tester);

//Navigation Bar Orientation
final clickNavAppointments = (WidgetTester tester) => clickNavAS.workflowApp(tester);
final clickNavStart = (WidgetTester tester) => clickNavAS.workflowStart(tester);
final clickNavMap = (WidgetTester tester) => clickNavAS.workflowMap(tester);
final clickNavFaq = (WidgetTester tester) => clickNavAS.workflowFaq(tester);
final clickPopUpNav = (WidgetTester tester) => clickNavAS.workflowPopUpNav(tester);
final clickNavImprint = (WidgetTester tester) => clickNavAS.workflowNavImpr(tester);
final clickNavUserData = (WidgetTester tester) => clickNavAS.workflowNavUserData(tester);
final clickNavHelp = (WidgetTester tester) => clickNavAS.workflowNavHelp(tester);

//Pushing the Buttons
final clickStartAppointments = (WidgetTester tester) => clickButtonsAS.workflow(tester);
final clickNoButton = (WidgetTester tester) => clickButtonsAS.workflowNoButton(tester);

//Abort the booking process
final abortBooking = (WidgetTester tester) => abortBookingAS.workflow(tester);

//Click Buttons during Booking process
final clickDate = (WidgetTester tester) => bookingActionsAS.workflowClickDate(tester);
final clickTime = (WidgetTester tester) => bookingActionsAS.workflowClickTime(tester);

//MapActions
final clickPanorama = (WidgetTester tester) => mapActionsAS.workflowPanorama(tester);
final clickStreetMap = (WidgetTester tester) => mapActionsAS.workflowStreetMap(tester);

//UserDataActions
final testNameVorname = (WidgetTester tester) => userDataActionsAS.workflowTestNameVorname(tester);
final testNameNachname = (WidgetTester tester) => userDataActionsAS.workflowTestNameVornameNachname(tester);
final testNameZwischenname = (WidgetTester tester) => userDataActionsAS.workflowTestNameVornameZwischennameNachname(tester);
final testNameSonderzeichen = (WidgetTester tester) => userDataActionsAS.workflowTestNameSonderzeichenNachname(tester);
final testNameDoppelname = (WidgetTester tester) => userDataActionsAS.workflowTestDoppelnameNachname(tester);

final testGenderM = (WidgetTester tester) => userDataActionsAS.workflowTestGenderm(tester);
final testGenderW = (WidgetTester tester) => userDataActionsAS.workflowTestGenderw(tester);
final testGenderD = (WidgetTester tester) => userDataActionsAS.workflowTestGenderd(tester);
final testGenderMannlich = (WidgetTester tester) => userDataActionsAS.workflowTestGendermannlich(tester);
final testGenderWeiblich = (WidgetTester tester) => userDataActionsAS.workflowTestGenderweiblich(tester);
final testGenderDivers = (WidgetTester tester) => userDataActionsAS.workflowTestGenderdivers(tester);

final testNumbers = (WidgetTester tester) => userDataActionsAS.workflowTestNumbers(tester);
final testNumberSame = (WidgetTester tester) => userDataActionsAS.workflowTestNumberSame(tester);
final testNumberSlash = (WidgetTester tester) => userDataActionsAS.workflowTestNumberSlash(tester);
final testNumberDoppel = (WidgetTester tester) => userDataActionsAS.workflowTestNumberDoppel(tester);