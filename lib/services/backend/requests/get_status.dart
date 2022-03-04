import 'dart:convert';

import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/provider_service.dart';

Future<bool> getRequestStatus({required int appointmentId}) async {
  String path = "/appointment_status";
  String dateParam = genParam(key: "id", value: appointmentId.toString());
  path = path + "?" + dateParam;

  final response = await BackendService().getRequest(path: path);

  if (response.statusCode != 200) {
    print("error getRequestStatus");
    return false;
  }

  //Convert String to Map
  List jsonList = jsonDecode(response.body) as List; //TODO: Has to be fixed in django.
  Map<String, dynamic> json = jsonList[0];

  //Convert each List of Map to a List of a model
  Request request = Request.fromJson(json);

  //Update BookingService reference
  BookingService().bookedAppointment?.request = request;
  ProviderService().container.read(bookedAppointmentUpdateProvider.state).state++;

  return true;
}
