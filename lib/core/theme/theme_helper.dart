import 'package:flutter/material.dart';

class ThemeHelper {
  static const Color primaryColors = Color(0xffFF6F42);
  static const Color secondaryColors = Colors.black;
  static const Color backgroundColors = Colors.white;
  static const Color textFieldColors = Colors.grey;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColors,
      secondaryHeaderColor: secondaryColors,
      scaffoldBackgroundColor: backgroundColors,

      appBarTheme: AppBarTheme(
        backgroundColor: primaryColors,
        iconTheme: IconThemeData(color: secondaryColors),
        titleTextStyle: TextStyle(color: secondaryColors, fontSize: 20),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: textFieldColors),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: textFieldColors.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColors,
            width: 1.0,
          ),
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColors,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          minimumSize: Size(double.infinity, 0), // Makes width expand
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),

    );
  }
}
