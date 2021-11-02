import 'package:flutter_test/flutter_test.dart';

import 'skipIntro.dart' as skipIntroAS;
import 'clickNav.dart' as clickNavAS;
import 'clickStartAppointments.dart' as clickStartAS;

//Skipping Introduction
final skipIntro = (WidgetTester tester)=>skipIntroAS.workflow(tester);

//Navigation Bar Orientation
final clickNavAppointments = (WidgetTester tester)=>clickNavAS.workflowApp(tester);
final clickNavStart = (WidgetTester tester)=>clickNavAS.workflowStart(tester);
final clickNavMap = (WidgetTester tester)=>clickNavAS.workflowMap(tester);
final clickNavFaq = (WidgetTester tester)=>clickNavAS.workflowFaq(tester);

//Pushing the Book Appointment Button inside the Appointment window
final clickStartAppointments = (WidgetTester tester)=>clickStartAS.workflow(tester);

