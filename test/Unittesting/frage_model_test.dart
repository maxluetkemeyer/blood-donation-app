import 'package:blooddonation/appointment_booking/questions/question_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given frage_model Object is created when asked for isYesCorrect Then the defined isYesCorrect is put out',
      () {
    // ARRANGE
    Question question = Question('Ist das eine Frage?', true);
    // ACT
    var res = question.isYesCorrect;
    // ASSERT
    expect(res, true);
  });
}
