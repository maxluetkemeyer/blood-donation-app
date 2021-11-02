/*
This class defines the model for a question in the faq question system, meaning the ExpansionPanelList
*/
class Question{
  final String id;
  final String question;
  final String answer;

  const Question({required this.id, required this.question, required this.answer});
}