// ignore_for_file: library_prefixes, prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';

import 'skip_intro.dart' as skipIntroAS;
import 'click_nav.dart' as clickNavAS;
import 'click_buttons.dart' as clickButtonsAS;
import 'abort_booking.dart' as abortBookingAS;
import 'booking_actions.dart' as bookingActionsAS;

//Skipping Introduction
final skipIntro = (WidgetTester tester) => skipIntroAS.workflow(tester);

//Navigation Bar Orientation
final clickNavAppointments = (WidgetTester tester) => clickNavAS.workflowApp(tester);
final clickNavStart = (WidgetTester tester) => clickNavAS.workflowStart(tester);
final clickNavMap = (WidgetTester tester) => clickNavAS.workflowMap(tester);
final clickNavFaq = (WidgetTester tester) => clickNavAS.workflowFaq(tester);
final clickPopUpNav = (WidgetTester tester) => clickNavAS.workflowPopUpNav(tester);
final clickNavImprint = (WidgetTester tester) => clickNavAS.workflowNavImpr(tester);

//Pushing the Buttons
final clickStartAppointments = (WidgetTester tester) => clickButtonsAS.workflow(tester);
final clickNoButton = (WidgetTester tester) => clickButtonsAS.workflowNoButton(tester);

//Abort the booking process
final abortBooking = (WidgetTester tester) => abortBookingAS.workflow(tester);

//CLick Buttons during Booking process
final clickDate = (WidgetTester tester) => bookingActionsAS.workflowClickDate(tester);
final clickTime = (WidgetTester tester) => bookingActionsAS.workflowClickTime(tester);
