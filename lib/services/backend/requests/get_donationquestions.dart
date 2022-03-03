import 'dart:convert';

import 'package:blooddonation/models/donationquestions_model.dart';
import 'package:blooddonation/services/backend/backend_service.dart';

Future<bool> getDonationQuestions() async {
  String path = "/donationquestions";

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode == 200) {
    var donObjsJson = jsonDecode(response.body) as List;

    List<DonationQuestion> donQue = donObjsJson.map((donJson) => DonationQuestion(id: -1, position: 0, isYesCorrect: true)).toList();

    print(donQue);
    return true;
  } else {
    print("error getDonationQuestions");
    return false;
  }
}
