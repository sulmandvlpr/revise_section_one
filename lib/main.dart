import 'package:flutter/material.dart';
import 'package:revise_section_one/widgets/expenses.dart';
// import 'package:flutter/services.dart';

//Theming apply on MaterialApp
//decalare global Color Scheme  with single Color value
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 229, 81, 255));

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 200, 168, 252));
void main() {
//   //this is reqire to make sure that locking the orientation
//   WidgetsFlutterBinding.ensureInitialized();
// SystemChrome.setPreferredOrientations([
//   DeviceOrientation.portraitUp
// ]).then((fn) {

  runApp(
    MaterialApp(
      //theming
      //copyWith() method provide some defualt styling on things like widgets,scaffold
      //save our time to theme every thing from scratch
      //allow us to set default colors like primary ,secondary color , button colors
      theme: ThemeData().copyWith(
          //useMaterial3 apply some latest style like round the button
          useMaterial3: true,
          colorScheme: kColorScheme,
          //appbar color
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          //card color
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          //elevated button color
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
          ),
          //text color
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 14),
              )),
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: kDarkColorScheme,

        //dark card theme
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        //dark elevated button color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),

      home: const Expenses(),
    ),
  );
}
