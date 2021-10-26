import 'faq_question_model.dart';

class FaqQuestionList {
  final _questionList = [
    Question(
      id: 'q1',
      question: 'Wie mache ich einen Termin zum Blutspenden in dieser App ab?',
      answer:
          'Entweder über den Startbildschirm oder über das Menü kann man Anmeldung auswählen. Bevor man sich einen Termin aussuchen kann, werden ein paar generelle Fragen gestellt, die eine Blutspende verhindern könnten. Sollte nach den Fragen eine Blutspende möglich kein, kann über die Kalenderfunktion ein Termin ausgewählt werden. Der Termin ist verbindlich, wenn er in der App als bestätigt gilt.',
    ),
    Question(
      id: 'q2',
      question: 'Warum sollte ich Blut spenden?',
      answer:
          'Blutspenden sichern die Versorgung von Patienten während Operationen und Therapien, somit rettet gespendetes Blut Leben.',
    ),
    Question(
      id: 'q3',
      question: 'Was muss ich als Erstspender beachten?',
      answer:
          'Erstspender bekommen von uns einen umfangreichen Fragebogen ausgehändigt, um Ihre Krankengeschichte und eventuelle Ausschlusskriterien für eine Spende zu erfassen\nDamit Sie mit einen sicheren Gefühl zu Ihrer ersten Blutspende gehen können, legen wir besonderen Wert darauf, dass ein Erstspender umfassend informiert wird, Fragen beantworten wir gerne im Arztgespräch',
    ),
    Question(
      id: 'q4',
      question: 'Was muss ich vor einer Blutspende beachten?',
      answer:
          'Vor der Spende solltest du ausreichend gegessen und mindestens 1,5 Liter alkoholfreie Flüssigkeit zu sich genommen haben. Nicht mit nüchternem Magen zum Blutspendetermin kommen!',
    ),
    Question(
      id: 'q5',
      question: 'Wer darf Blutspenden?',
      answer:
          'Sie müssen zwischen 18 und 68 Jahre alt sein, jedoch bei Aufnahme in unsere Spenderdatei als Erstspender nicht älter als 60 Jahre alt sein.\nSie müssen völlig gesund sein und mindestens 50 kg wiegen.\nIn den vergangenen 4 Wochen darf keine Magen-Darm-Infektion, kein fieberhafter Infekt und keine andere Infektionskrankheit vorgelegen haben.\nSie dürfen keine bestehenden Grunderkrankungen (wie z. B. Diabetes,  Bluthochdruck, Herzkrankheiten, Autoimmunerkrankungen, Epilepsie usw.) haben.\nSie dürfen nicht regelmäßig Medikamente (außer Hormonpräparate) einnehmen.\nWährend Ihrer Schwangerschaft und der Stillzeit dürfen Sie kein Blut spenden.\nSie dürfen keine Tumorkrankheiten haben.\nAuslandsreisen (auch innerhalb von Europa) können unter Umständen einen befristeten Ausschluß von der Blutspende nach sich ziehen. Bitte kontaktieren Sie uns gerne für weitere Informationen unter unserer Hotline 0251-8358000. Sie dürfen sich in dem Zeitraum zwischen 1980 und 1996 nicht länger als sechs Monate in Großbritannien aufgehalten haben (auch Kurzaufenthalte zusammengerechnet).\nSie dürfen in den letzten vier Monaten nicht gepierct oder tätowiert worden sein.\nSie dürfen kein Piercing im Mund- oder Intimbereich haben.\nSie dürfen in Ihrem Leben nicht an einer Malaria erkrankt sein.\nSie dürfen keine Operationen, Magen- oder Darmspiegelungen in den letzten vier Monaten gehabt haben\nBei neuen Sexualpartnern erfolgt eine zeitlich begrenzte Rückstellung von der Blutspende für 4 Monate.\nVor eine Blutspende sollten Sie ausreichend gegessen und getrunken haben.',
    ),
    Question(
      id: 'q6',
      question: 'Wie verläuft eine Blutspende?',
      answer:
          'Nach der Anmeldung zu der Blutspende muss vor Ort ein Fragebogen ausgefüllt werden. Vor der Spende wird die Konzentration des Hämoglobins im Blut geprüft. Nach einem Arztgespräch, bei dem der Gesundheitszustand der Spender:innen abgefragt wird, kann Blut gespendet werden. Eine Blutspende benötigt maximal 12 Minuten. Die Einzelspende hat ein Volumen von ca 450 ml Blut. Nach der Spende sollten noch ca. 30 Minuten im Wartezimmer verbracht werden, um Kreislaufreaktionen zu vermeiden. Dazu gibt es Getränke, einen Imbiss und eine Aufwandsentschädigung.',
    ),
    Question(
      id: 'q7',
      question: 'Was passiert mit dem gespendeten Blut?',
      answer:
          'Jede Blutspende wird auf HIV und andere Erreger getestet. Dazu wird die Blutgruppe und der Rhesusfaktor bestimmt. Das Blut wird in seine verschiedenen Komponenten: \n Die roten Blutkörperchen (Erythrozyten)\n Die Blutplättchen (Thrombozyten)\n Die Blutflüssigkeit (Plasma)\naufgetrennt und zu Blutpräparaten verarbeitet. Diese werden an die Patienten mit Bedarf geliefert.',
    ),
    Question(
      id: 'q8',
      question: 'Was gibt es für Aufwandsentschädigung?',
      answer:
          'Die Erstspende wird mit 10,00 € vergütet, ab der 2. liegt der Betrag bei 20,00 €, bei der 3. im Kalenderjahr einmalig erhält der Spender einmalig 30,00 € für eine der drei Spenden.\nDer Betrag kann auch auf Wunsch gespendet werden.',
    ),
    Question(
      id: 'q9',
      question: 'Was gibt es für Risiken?',
      answer:
          'Für die Blutentnahme wird ausschließlich steriles Einwegmaterial verwendet. Eine Ansteckungsgefahr ist für Sie somit ausgeschlossen. Die Blutspende selbst wird im Allgemeinen gut vertragen; trotzdem sollten Sie sich am Spendetag nicht vermehrter körperlicher Belastung aussetzen.',
    ),
    Question(
      id: 'q10',
      question: 'Wie oft darf man Blut spenden?',
      answer:
          'Frauen dürfen alle zwölf Wochen, jedoch maximal vier Mal im Jahr, zur Vollblutspende gehen. Männer dürfen alle acht Wochen, jedoch maximal sechs Mal im Jahr, zur Vollblutspende gehen.',
    ),
    Question(
      id: 'q11',
      question: 'Warum wird meine Blutgruppe in der App gespeichert?',
      answer:
          'Bei Blutmangel werden Spender über diese App informiert. Damit wir spezifisch die Personen mit der entsprechenden Blutgruppe erreichen und benachrichtigen können, speichern wir die Blutgruppe ab.',
    ),
  ];

  List<Question> get qList {
    return this._questionList;
  }
}
