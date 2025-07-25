import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    hintColor: darkBluishColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBluishColor, // button background color
      foregroundColor: Colors.white, // icon/text color on button
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.bodyLarge,
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
    ),
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black, //this color is not working see home_page.dart
    canvasColor: darkCreamColor,
    hintColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData( //used instead of buttonColor
      backgroundColor: lightBluishColor, // button background color
      foregroundColor: Colors.white, // icon/text color on button
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
  //static Color  = Vx.indigo500;
}
