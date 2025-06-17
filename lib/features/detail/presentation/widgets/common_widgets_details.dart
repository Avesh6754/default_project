import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';

Row buildDescriptionCard(String text,String text2) {
  return Row(
    spacing: 20,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      buildTextCommon(text),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTextCard(text2, true),
        ],
      ),

    ],
  );
}

Text buildTextCard(String text, bool isPrimary) {
  return Text(
    text,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: (isPrimary)
            ? ThemeHelper.primaryColors
            : ThemeHelper.textFieldColors,
      ),
    ),
  );
}

Text buildTextCommon(String text) {
  return Text(
    text,
    style: GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
  );
}

Text buildTextMethod(String text, Color color) {
  return Text(
    text,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}