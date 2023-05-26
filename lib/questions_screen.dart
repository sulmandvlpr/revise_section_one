import 'package:flutter/material.dart';
import 'package:revise_section_one/answers_button.dart';
import 'package:revise_section_one/data/questions.dart';

//to display data from question List imporat and Access Elements of List by listName[elemntnum]
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    //access questions List by import
    //store value of List in variable
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            //access the Property of questions List class by classname.prperty type
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
          AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
          AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
        ],
      ),
    );
  }
}
