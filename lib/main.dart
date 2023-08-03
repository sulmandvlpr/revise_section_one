import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:revise_section_one/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revise_section_one/provider/meals_provider.dart';

//theme vairable to store theme

final theme = ThemeData(
  //for round shapes theme
  useMaterial3: true,
  //set defulat color
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 131, 57, 0)),
  //set defulat font family
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      //remove const later
      //main screen Widget
      home: const TabsScreen(),
    );
  }
}
