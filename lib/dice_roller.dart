import 'dart:math';

import 'package:flutter/material.dart';

// flutter require 2 differnt class detach from each other
class DiceRoller extends StatefulWidget {
//we can set this DicRoller to const but we cannot set DiceRollerState class const
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
//retrun Construction fun / _DiceRollerState Widget
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    
    var diceRoll = Random().nextInt(6);
    setState(() {
      activeDiceImage = 'assets/images/dice-$diceRoll.png';
    });
  }
// we need a way (method) to re-execute this build method when we change the value of variable and render(display) the updated values
// for that we use setState() method
// we apply this method where we craete a update logic function

  @override
  Widget build(context) {
    return Column(
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
    );
  }
}
