import 'package:flutter/material.dart';
import 'package:revise_section_one/styled_text.dart';

// one important role of Variables (data containers) is we define it on top so we
//can easily access it later without dive deep in to widget tree
//helps us in large projects
//variable assign with 'var' can be re-assign with new value
//variable in dart have Type it take that value when we assign to a value
//in the variable below the Type of startAlignment is Alignment
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  //cosntrucutor function & const keyword
  //this super is represent parent class which is stateless
  const GradientContainer({super.key});
//build calls automatically by flutter when we initilze GradinetContainer object

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 45, 7, 98),
          ],
          begin: startAlignment,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
