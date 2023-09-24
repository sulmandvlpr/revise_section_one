import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revise_section_one/screens/places.dart';

//theme vairable to store theme

final theme = ThemeData(
  //for round shapes theme
  useMaterial3: true,
  //set defulat color
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 70, 188, 88)),
  //set defulat font family
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  ),
);

// void main() {
//   runApp(const ProviderScope(child: App()));
// }

void main() {
//ProviderScope(App)
//Now we use this provider User Places  on alot of classes we we make this abailble to Main Class
//with Main class it will automatically availabe to alot of places in app
//User ProvierScoper in Main runApp to availble provider on all app
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      //remove const later
      //main screen Widget
      home: PlacesScreen(),
    );
  }
}
