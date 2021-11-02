import "package:flutter_riverpod/flutter_riverpod.dart";

/// Provides the active step value as state
final bookingStateProvider = StateProvider<int>((ref) {
  return 0;
});
