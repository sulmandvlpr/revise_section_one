import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
// we need to except the text here
  const StyledText(this.ivtext, {super.key});
//to use this text in build method or any other method inside this class
//we need to have class variable
  final String ivtext;

  @override
  Widget build(BuildContext context) {
    return Text(
      ivtext,
      style: const TextStyle(fontSize: 28),
    );
  }
}
