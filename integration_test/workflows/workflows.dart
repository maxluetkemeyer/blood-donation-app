import 'package:flutter_test/flutter_test.dart';

import 'skipIntro.dart' as skipIntroAS;
import 'clickNav.dart' as clickNavAS;
import 'clickButtons.dart' as clickButtonsAS;
import 'abortBooking.dart' as abortBookingAS;
import 'bookingActions.dart' as bookingActionsAS;

//Skipping Introduction
final skipIntro = (WidgetTester tester)=>skipIntroAS.workflow(tester);

//Navigation Bar Orientation
final clickNavAppointments = (WidgetTester tester)=>clickNavAS.workflowApp(tester);
final clickNavStart = (WidgetTester tester)=>clickNavAS.workflowStart(tester);
final clickNavMap = (WidgetTester tester)=>clickNavAS.workflowMap(tester);
final clickNavFaq = (WidgetTester tester)=>clickNavAS.workflowFaq(tester);

//Pushing the Buttons
final clickStartAppointments = (WidgetTester tester)=>clickButtonsAS.workflow(tester);
final clickNoButton = (WidgetTester tester)=>clickButtonsAS.workflowNoButton(tester);

//Abort the booking process
final abortBooking = (WidgetTester tester)=>abortBookingAS.workflow(tester);

//CLick Buttons during Booking process
final clickDate = (WidgetTester tester)=>bookingActionsAS.workflowClickDate(tester);
final clickTime = (WidgetTester tester)=>bookingActionsAS.workflowClickTime(tester);