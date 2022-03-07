import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/models/donationquestions_model.dart';
import 'package:blooddonation/models/donationquestiontranslation_model.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:language_picker/languages.dart';

export 'package:blooddonation/models/appointment_model.dart';
export 'package:blooddonation/models/request_model.dart';

class BookingService {
  //Singleton
  static final BookingService _instance = BookingService._private();
  factory BookingService() => _instance;
  BookingService._private() {
    print("Starting Booking Service");
  }

  List<DonationQuestion> donationQuestions = [];
  List<DonationQuestionTranslation> donationQuestionTranslations = [];

  ///List of Appointments that saves all Free Appointments.
  List<Appointment> freeAppointments = [];

  ///Saves the user selected appointment during the booking process.
  Appointment? selectedAppointment;

  ///Current booked appointment
  Appointment? bookedAppointment;

  ///Resets the Process Variables
  void resetProcess() {
    selectedAppointment = null;
    freeAppointments = [];
    donationQuestions.clear();
    donationQuestionTranslations.clear();
    ProviderService().container.read(bookingStateProvider.state).state = 0;
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
