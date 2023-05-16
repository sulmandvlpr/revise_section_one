import 'package:flutter/material.dart';
import 'package:revise_section_one/styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;
// we want to use gradinet color dynamic so we modify the color value later
// so we need to extract out from widget tree and use as dynamic value to modify later

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

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
      child: const Center(
        child: StyledText('some text dispay'),
      ),
    );
  }
}
