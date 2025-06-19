import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';

Widget buildDescriptionCard(String text, String text2) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildTextCommon(text)],
        ),
      ),
      Expanded(
        flex: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildTextCard(text2, true)],
        ),
      ),
    ],
  );
}

Text buildTextCard(String text, bool isPrimary) {
  return Text(
    text,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 16,
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
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
