import 'package:blooddonation/appointment_booking/booking/appointmentbox_widget.dart';
import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Appointment Box Tests', () {
    testWidgets(
        'Given One AppointmentBox is created When an AppointmentBox is Tapped on once Then the BookingService instance has a selected Appointment',
        (WidgetTester tester) async {
      //ARRANGE
      Appointment testAppointment = Appointment(
        id: 1,
        start: DateTime.utc(2020, 2, 20),
        duration: const Duration(hours: 1),
      );

      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(
        home: AppointmentBox(appointment: testAppointment),
      )));
      //ACT
      final appointment = find.byType(AppointmentBox);
      await tester.tap(appointment);
      await tester.pumpAndSettle();
      //ASSERT
      expect(BookingService().selectedAppointment, testAppointment);
    });
  });
}
