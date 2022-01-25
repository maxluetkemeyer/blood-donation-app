import '../models/faqquestion_model.dart';

///List saves all the [FaqQuestion]'s. A new question can be created by adding a new FaqQuestion to this List.
List<FaqQuestion> faqQuestionList(context) => [
      FaqQuestion(
        id: -1,
        position: 0,
      ),
    ];



/*
List<FaqQuestion> faqQuestionList(context) => [
      FaqQuestion(
        id: 'q1',
        question: AppLocalizations.of(context)!.faqQ1Heading,
        answer: AppLocalizations.of(context)!.faqQ1Body,
      ),
      FaqQuestion(
        id: 'q2',
        question: AppLocalizations.of(context)!.faqQ2Heading,
        answer: AppLocalizations.of(context)!.faqQ2Body,
      ),
      FaqQuestion(
        id: 'q3',
        question: AppLocalizations.of(context)!.faqQ3Heading,
        answer: AppLocalizations.of(context)!.faqQ3Body,
      ),
      FaqQuestion(
        id: 'q4',
        question: AppLocalizations.of(context)!.faqQ4Heading,
        answer: AppLocalizations.of(context)!.faqQ4Body,
      ),
      FaqQuestion(
        id: 'q5',
        question: AppLocalizations.of(context)!.faqQ5Heading,
        answer: AppLocalizations.of(context)!.faqQ5Body,
      ),
      FaqQuestion(
        id: 'q6',
        question: AppLocalizations.of(context)!.faqQ6Heading,
        answer: AppLocalizations.of(context)!.faqQ6Body,
      ),
      FaqQuestion(
        id: 'q7',
        question: AppLocalizations.of(context)!.faqQ7Heading,
        answer: AppLocalizations.of(context)!.faqQ7Body,
      ),
      FaqQuestion(
        id: 'q8',
        question: AppLocalizations.of(context)!.faqQ8Heading,
        answer: AppLocalizations.of(context)!.faqQ8Body,
      ),
      FaqQuestion(
        id: 'q9',
        question: AppLocalizations.of(context)!.faqQ9Heading,
        answer: AppLocalizations.of(context)!.faqQ9Body,
      ),
    ];
*/