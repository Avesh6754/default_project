import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        iconTheme: IconThemeData(color: backgroundColors),
        elevation: 2,
        titleTextStyle: GoogleFonts.nunito(
          textStyle: TextStyle(
            color: backgroundColors,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.nunito(
          textStyle: TextStyle(color: Color(0xffCECCD9)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffCECCD9), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffCECCD9), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColors, width: 1.0),
        ),
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
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(primaryColors),
        fillColor: MaterialStateProperty.all(backgroundColors),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        side: WidgetStateBorderSide.resolveWith((states) {
          return BorderSide(color: textFieldColors.withOpacity(0.5),width: 1);
        },)
      ),
    );
  }
}
