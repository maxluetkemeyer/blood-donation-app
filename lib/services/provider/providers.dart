import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter/material.dart';

/// Provides the active step of the booking processvalue as state
final bookingStateProvider = StateProvider<int>((ref) {
  return 0;
});

/// Provides the active step of the question process as state
final questionStepStateProvier = StateProvider<int>((ref) {
  return 0;
});

final bookedAppointmentUpdateProvider = StateProvider<int>((ref) {
  return 0;
});

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale("de");
});