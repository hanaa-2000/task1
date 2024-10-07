import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: darkBluishColor,
      secondary: darkBluishColor,
      onPrimary: Colors.white, // Text color on primary buttons
      onSecondary: Colors.black, // Text color on secondary buttons
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: const Color(0xff090B0F),
    canvasColor: darkColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: lightBluishColor,
      secondary: Colors.white,
      onPrimary: Colors.black, // Text color on primary buttons
      onSecondary: Colors.black, // Text color on secondary buttons
    ),
    appBarTheme: AppBarTheme(
      color: darkColor,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
  );
  static Color creamColor = const Color(0xfff4f5fc);
  static Color darkBluishColor = const Color(0xff1a191c);
  static Color darkColor = const Color(0xFF1F1F1F);
  static Color lightBluishColor = const Color(0xFF6E40C9);
// static Color orange = Color(0xfff68a0a);
}
