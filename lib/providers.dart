import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'termin_buchung/termin_model.dart';

// Provider
final tappedDayProvider = StateProvider<bool>((ref) {
  return false;
});

final selectedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final selectedTerminProvider = StateProvider<Termin>((ref) {
  return Termin(id: "", time: DateTime.now());
});
