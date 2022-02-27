// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:blooddonation/models/donationquestions_model.dart';
import 'package:blooddonation/models/donationquestiontranslation_model.dart';
import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';

Future<bool> getDonationQuestions() async {
  String path = "/donationquestions";

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode != 200) {
    print("error getDonationQuestions");
    return false;
  }

  //Convert String to Map
  Map<String, dynamic> json = jsonDecode(response.body);

  //Extract Lists of Maps
  List<dynamic> donationQuestionMaps = json["donationQuestions"];
  List<dynamic> donationQuestionTranslationMaps = json["donationQuestionTranslations"];

  //Convert each List of Map to a List of a model
  List<DonationQuestion> donationQuestions =
      donationQuestionMaps.map((donationQuestionMap) => DonationQuestion.fromJson(donationQuestionMap)).toList();
  List<DonationQuestionTranslation> donationQuestionTranslaions = donationQuestionTranslationMaps
      .map((donationQuestionTranslationMap) => DonationQuestionTranslation.fromJson(donationQuestionTranslationMap))
      .toList();

  //Update BookingService references
  BookingService().donationQuestions = donationQuestions;
  BookingService().donationQuestionTranslations = donationQuestionTranslaions;

  return true;
}
