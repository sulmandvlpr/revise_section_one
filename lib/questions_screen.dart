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
      //to give dynamic text button fix shape wrape them with container and padding them
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //access the Property of questions List class by classname.prperty type
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // ...currentQuestion.answers.map((answers) => AnswerButton(onTap: (){}, answerText: answers))
            //set button text dynamically based on answers list
            //so we need to convert answers list to widget answer list
            //we convert list to widget list by applying .map((list element){}) method to list  which returns new Widget List
            //.map return New Widget list but column have childer list [] so we use ...
            //... spereding will take all value from list and pull them out from list and save them in comma seprated values
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(onTap: () {}, answerText: answer);
            }),
          ],
        ),
      ),
    );
  }
}
