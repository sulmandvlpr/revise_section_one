import 'package:flutter/material.dart ';
import 'package:revise_section_one/data/questions.dart';
import 'package:revise_section_one/questions_screen.dart';

import 'package:revise_section_one/start_screen.dart';

//📝 to use SatetfulWdiget class porperties in State class use widget.
//display diffrent screen when answers are done
//save the selcted answers
//here we question screen and later we have result screen so we
//lift this widget and mannage state here
//now we have store variable and method to store answers
//now we have answer selecting method in quiz dart and button for picking answer is in the question_sreen screen.dart
// we gona do that by passing this answer slecing method to constructor of Quiz widget
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//we have  variable here to store the current slected answer
//store list of answer for all question  q1 ans , q2 ans
  List<String> sletectedAnswer = [];

//now we need method to add answers  to list
//seleted answer will added to this selctedAnswer List
//now when we click on answer button this method executed and save selected answer
//button  is prsent in question_screen  so we forward selecteAns method via constructor of questionScreen(sletedAnswer)
  void chosenAnswer(String answer) {
    //add the seleceAnswer to list of answers
    sletectedAnswer.add(answer);
//reset seletedAnswer to empty list when done
    sletectedAnswer = [];
//once we slected all answer we check if all the answer are chosen then we go to start-screen
    if (sletectedAnswer.length == questions.length) {
//then reset to start screen
      setState(() {
        activeScreen = 'start-screen';
      });
    }
  }

  //we can store some identifier for screen name as string
  var activeScreen = 'start-screen'; // it could be number also e.g 1,3

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 109, 46, 218),
                Color.fromARGB(255, 211, 71, 236)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // == is comparision operator
          // value after ? expecte if the option is true
          // value after : execute if option is false
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionsScreen(onSelectedAnswer: chosenAnswer),
        ),
      ),
    );
  }
}
