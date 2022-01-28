import 'package:blooddonation/services/backend/backend_service.dart';

Future<bool> getRequestStatus(int appointmentId) async {
  String path = "/appointment_status";
  String dateParam = genParam(key: "id", value: appointmentId.toString());
  path = path + "?" + dateParam;

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode == 200) {



    return true;
  } else {
    print("error getDonationQuestions");
    return false;
  }
}
