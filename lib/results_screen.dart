import 'package:flutter/material.dart';
import 'package:revise_section_one/data/questions.dart';
import 'package:revise_section_one/quiz_summery.dart';

//this screen shows result on ui/screen
//data we collet list of answers from quiz widget  and quesitons from data/questions
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});
//choseAnswer is List of sletced Answers
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummeryData() {
//empty list of map type
    final List<Map<String, Object>> summery = [];
    //for loop allow us to execute a code mutltiple times
    //contain 3 parts
    //1st loop's variable and its inital value
    //2nd conditon which tells how long this loop keep on running with the help of loop's variable
//3rd controls how loop will change on every iternation
    for (var i = 0; i < chosenAnswer.length; i++) {
// loop body
      // i want to add itesm to sumry List above[]
      summery.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //pass question as answer
            QuestionsSummery(getSummeryData()),
            const SizedBox(
              height: 30,
            ),
            const Text('List of questions and answers'),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
