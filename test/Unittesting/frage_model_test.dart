import '../../lib/appointment_booking/frage_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Given frage_model Object is created when asked for isYesCorrect Then the defined isYesCorrect is put out',(){
    // ARRANGE
    Frage frage = Frage('Ist das eine Frage?', true);
    // ACT
  	var res = frage.isYesCorrect;
    // ASSERT
    expect(res, true);
  });
}