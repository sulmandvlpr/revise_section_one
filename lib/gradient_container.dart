import 'package:flutter/material.dart';
import 'package:revise_section_one/styled_text.dart';

class GradientContainer extends StatelessWidget {
  //cosntrucutor function & const keyword
  //this super is represent parent class which is stateless
  const GradientContainer({super.key});
//build calls automatically by flutter when we initilze GradinetContainer object

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 45, 7, 98),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
