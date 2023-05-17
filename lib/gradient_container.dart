import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

// now we planing what happens when we clik the botton
// button value is change able we need variabls
// and the const GradinetContainer is no more const because It Can Change Internelly

class GradientContainer extends StatelessWidget {
  GradientContainer(this.colors, {super.key});

  final List<Color> colors;

//define func after construction function and instace variables

  var activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    activeDiceImage = 'assets/images/dice-4.png';
  }

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
              activeDiceImage,
              width: 200,
            ),
            //Sized box cut off widget which is out of its bound
            //while the other widget for sizing is don't cut off extra content
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
