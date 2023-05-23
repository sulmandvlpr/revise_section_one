import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  //pass fun swithcScreen as parameter
  const StartScreen(this.switchScreen, {super.key});
  //create instace class variable of function
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/iamges/dice-1.png',
          width: 300,
        ),
        const SizedBox(height: 80),
        const Text(
          'Learn Flutter',
          style: TextStyle(
              color: Color.fromARGB(255, 254, 251, 240), fontSize: 24),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: switchScreen,
          //we can set default button style from .styleFrom() method
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          label: const Text('Start Quiz'),
          icon: const Icon(Icons.start_outlined),
        ),
      ],
    );
  }
}
