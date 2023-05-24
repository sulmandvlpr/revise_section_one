import 'package:flutter/material.dart ';
import 'package:revise_section_one/questions_screen.dart';

import 'package:revise_section_one/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
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
                : const QuestionsScreen()),
      ),
    );
  }
}
