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
  // we can also Store Widget in Variable
  // we can set var to Widget to use any Widget type
  //it will accept fun swtichScren as arg
  //now activeScreen is initilly null
  Widget? activeScreen;

  //for extra intilization work we need initState() method
  //it will initlize the state properties before initlizing other things so it can store in momory
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
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
            child: activeScreen),
      ),
    );
  }
}
