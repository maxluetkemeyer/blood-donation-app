import 'package:blooddonation/services/backend/backend_service.dart';

Future<bool> getFaqQuestions() async {
  String path = "/faqquestions";

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode == 200) {
    return true;
  } else {
    print("error getFaqQuestions");
    return false;
  }
}
