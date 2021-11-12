import 'package:blooddonation/appointment_booking/questions/donationquestion_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given frage_model Object is created when asked for isYesCorrect Then the defined isYesCorrect is put out',
      () {
    // ARRANGE
    DonationQuestion question = DonationQuestion('Ist das eine Frage?', true);
    // ACT
    var res = question.isYesCorrect;
    // ASSERT
    expect(res, true);
  });
}
