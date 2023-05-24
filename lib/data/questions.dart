import 'package:revise_section_one/models/quiz_question.dart';

//crate instace of QuizQuestion model class object
const questions = [
  QuizQuestion('What is the main building block of Flutter program',
      ['Widgets', 'Components', 'Blocks', 'Functions']),
  QuizQuestion('How Flutter UI build', [
    'by composing widget in code',
    'by composing widget in config file',
    'by composing widget in vs code',
    'by composing widget in android stuido',
  ]),
  QuizQuestion(
    'What is purpose of StateFul widget?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  )
];
