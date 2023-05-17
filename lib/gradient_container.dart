import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

//fun are also pass as values in flutter
// we define func on top so we can easy change thing without deep dive in to widget tree
// later when working with big project
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

//define func after construction function and instace variables

  void rollDice() {}

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-1.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: rollDice,
                //.styleFrom()fun return ButtonStyle and this ButtonStyle is also return of style arg
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Roll Dice')),
          ],
        ),
      ),
    );
  }
}
