import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/models/donationquestions_model.dart';
import 'package:blooddonation/models/donationquestiontranslation_model.dart';
import 'package:blooddonation/models/request_model.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:language_picker/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:blooddonation/models/appointment_model.dart';
export 'package:blooddonation/models/request_model.dart';

class BookingService {
  //Singleton
  static final BookingService _instance = BookingService._private();
  factory BookingService() => _instance;
  BookingService._private() {
    print("Starting Booking Service");
    _init();
  }

  late SharedPreferences _prefs;
  List<DonationQuestion> donationQuestions = [];
  List<DonationQuestionTranslation> donationQuestionTranslations = [];

  ///List of Appointments that saves all Free Appointments.
  List<Appointment> freeAppointments = [];

  ///Saves the user selected appointment during the booking process.
  Appointment? selectedAppointment;

  ///Current booked appointment
  Appointment? _bookedAppointment;
  Appointment? get bookedAppointment => _bookedAppointment;
  set bookedAppointment(Appointment? appointment) {
    _bookedAppointment = appointment;

    //delete persistent
    if (appointment == null) {
      _prefs.remove("bookedAppointment");
      return;
    }

    _prefs.setStringList("bookedAppointment", [
      appointment.id.toString(),
      appointment.start.toString(),
      appointment.duration.inMilliseconds.toString(),
      appointment.request!.id.toString(),
      appointment.request!.created.toString(),
      appointment.request!.status.toString(),
    ]);
  }

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey("bookedAppointment")) {
      List<String>? values = _prefs.getStringList("bookedAppointment");

      if (values == null) {
        _prefs.remove("bookedAppointment");
        return;
      }

      _bookedAppointment = Appointment(
        id: int.parse(values[0]),
        start: DateTime.parse(values[1]),
        duration: Duration(milliseconds: int.parse(values[2])),
        request: Request(
          id: int.parse(values[3]),
          created: DateTime.parse(values[4]),
          status: values[5],
        ),
      );
    }
  }

  ///Resets the Process Variables
  void resetProcess() {
    selectedAppointment = null;
    freeAppointments = [];
    donationQuestions.clear();
    donationQuestionTranslations.clear();
    ProviderService().container.read(bookingStateProvider.state).state = 0;
    ProviderService().container.read(questionStepStateProvier.state).state = 0;
  }

  ///Resets the BookingService
  void resetService() {
    resetProcess();
    bookedAppointment = null;
  }

  List<Map<String, dynamic>> getDonationQuestionList({required Language language}) {
    List<Map<String, dynamic>> output = [];

    // Iterate through the questions and return the translation in correct order
    for (int position = 0; position < donationQuestions.length; position++) {
      Map<String, dynamic> tupel = {};

      // Find question
      for (DonationQuestion question in donationQuestions) {
        if (question.position == position) {
          tupel["donationQuestion"] = question;
          break;
        }
      }

      // Find translation
      for (DonationQuestionTranslation translation in donationQuestionTranslations) {
        if (translation.donationQuestion == tupel["donationQuestion"].id && translation.language == language.isoCode) {
          tupel["donationQuestionTranslation"] = translation;
          break;
        }
      }
      output.add(tupel);
    }
    return output;
  }
}
