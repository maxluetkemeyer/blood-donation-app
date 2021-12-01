import 'package:blooddonation/services/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given the method stringToGender is called when either male, female or diverse is used as input then the fitting Gender is returned',
      () {
    // ACT
    var resMale = User.stringToGender("male");
    var resFemale = User.stringToGender("female");
    var resDiverse = User.stringToGender("diverse");
    var resNone = User.stringToGender("pwoöeugjpwjv");
    // ASSERT
    expect(resMale, Gender.male);
    expect(resFemale, Gender.female);
    expect(resDiverse, Gender.diverse);
    expect(resNone, Gender.none);
  });
}
