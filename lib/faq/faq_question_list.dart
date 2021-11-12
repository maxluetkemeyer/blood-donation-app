import 'faq_question_model.dart';

class FaqQuestionList {
  final _questionList = [
    const FaqQuestion(
      id: 'q1',
      question: 'Wie kann ich in dieser App einen Termin zum Blutspenden buchen?',
      answer:
          'Wenn Sie unten auf dem Startbildschirm die Option „Termine“ auswählen, werden Sie durch den Buchungsvorgang für einen Blutspendetermin geführt. ',
    ),
    const FaqQuestion(
      id: 'q2',
      question: 'Warum sollte ich Blut spenden?',
      answer:
          'Blut kann durch keine andere Flüssigkeit und keinen anderen Stoff ersetzt werden. Folglich sind Blutspenden essentiell für die Krankenversorgung. Eine einzige Blutspende von Ihnen könnte bis zu drei Leben retten.',
    ),
    const FaqQuestion(
      id: 'q3',
      question: 'Was muss ich als Erstspender:in beachten?',
      answer:
          'Bei Ihrer ersten Blutspende dauert der Aufenthalt etwas länger, da wir einige Formalitäten zu erledigen haben und mit Ihnen ein ausführliches Informationsgespräch führen möchten. Am Empfang werden Ihre Personalien unter Vorlage des Personalausweises oder Reisepasses aufgenommen. Die Daten unterliegen selbstverständlich dem Datenschutz. Anschließend erhalten Erstspender:innen einen umfangreichen Fragebogen, damit wir Ihre Krankengeschichte und eventuelle Ausschlusskriterien für eine Spende erfassen können. Damit Sie mit einen sicheren Gefühl zu Ihrer ersten Blutspende gehen können, legen wir besonderen Wert darauf, dass ein Erstspender umfassend informiert wird.',
    ),
    const FaqQuestion(
      id: 'q4',
      question: 'Was muss ich vor einer Blutspende beachten?',
      answer:
          'Am Tag Ihrer Blutspende sollten Sie viel trinken und normal essen, um Ihren Körper auf die Blutspende vorzubereiten. Auch sollten Sie einen Tag vor der Blutspende keine allzu fetthaltigen Speisen zu sich nehmen, da dies Einfluss auf die Qualität Ihres Blutplasmas haben kann. Das Rauchen einer Zigarette vor der Blutspende kann ebenfalls die Qualität Ihrer Blutkonserve beeinflussen. Vor und nach der Blutspende sollten Sie auf sportliche Aktivitäten verzichten.',
    ),
    const FaqQuestion(
      id: 'q5',
      question: 'Darf ich Blut spenden?',
      answer:
          'Um Blut spenden zu können müssen Sie zwischen 18 und 68 Jahre alt und völlig gesund sein. Erstspender müssen dabei unter 60 Jahre alt sein. Sie sollten mindestens 50kg wiegen und dürfen keine bestehenden Grunderkrankungen (wie z. B. Diabetes, Bluthochdruck, Herzkrankheiten, Autoimmunerkrankungen, Epilepsie usw.) oder Tumorkrankheiten haben. Sie dürfen nicht regelmäßig Medikamente (außer Hormonpräparate) einnehmen, schwanger sein oder stillen. Sie dürfen in den letzten vier Monaten nicht gepierct oder tätowiert worden sein und Sie dürfen kein Piercing im Mund- oder Intimbereich haben.',
    ),
    const FaqQuestion(
      id: 'q6',
      question: 'Wie läuft eine Blutspende ab?',
      answer:
          'Frühstücken oder essen Sie vor Ihrem Blutspendetermin ganz normal und bringen Sie auf jeden Fall Ihren gültigen Personalausweis oder Reisepass mit. Bei der Anmeldung erhalten Sie ein Informationsblatt und einen Fragebogen, den Sie bitte gewissenhaft ausfüllen. Danach erfolgt zunächst ein Arztgespräch, in dem Sie Gelegenheit haben, Fragen zu stellen. Anschließend wird der Blutfarbstoff Ihres Blutes bestimmt sowie Blutdruck, Puls und Temperatur werden gemessen. Sofern die Voruntersuchung unauffällig verläuft, werden Ihnen aus der Armvene 500 ml Blut entnommen, was ca. fünf bis zehn Minuten dauert. Danach müssen Sie sich noch eine Weile ausruhen, bis sich Ihr Kreislauf normalisiert hat.',
    ),
    const FaqQuestion(
      id: 'q7',
      question: 'Was passiert mit dem gespendeten Blut?',
      answer:
          'Nach der Spende wird das Blut in der Regel in seine Bestandteile getrennt. Diese können dann für eine gezielte Behandlung verwendet werden, denn die meisten Patienten benötigen nur bestimmte Bestandteile des Blutes. Mit einer einzigen Blutspende können Sie somit gleich mehreren Menschen helfen.',
    ),
    const FaqQuestion(
      id: 'q8',
      question: 'Was für Risiken existieren?',
      answer:
          'Für die Blutentnahme wird ausschließlich steriles Einwegmaterial verwendet. Eine Ansteckungsgefahr ist für Sie somit ausgeschlossen. Die Blutspende selbst wird im Allgemeinen gut vertragen - trotzdem sollten Sie sich am Spendetag nicht vermehrter körperlicher Belastung aussetzen.',
    ),
    const FaqQuestion(
      id: 'q9',
      question: 'Wie oft darf ich Blut spenden?',
      answer:
          'Frauen dürfen alle zwölf Wochen, jedoch maximal vier Mal im Jahr zur Vollblutspende gehen. Männer dürfen alle acht Wochen, jedoch maximal sechs Mal im Jahr zur Vollblutspende gehen.',
    ),
  ];

  List<FaqQuestion> get qList {
    return _questionList;
  }
}
