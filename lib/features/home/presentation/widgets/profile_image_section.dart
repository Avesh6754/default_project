import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';

Row buildProfielImage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 78,
        width: 78,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ThemeHelper.textFieldColors,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ThemeHelper.backgroundColors,
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage('assets/jpg/profile.jpg'),
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Hello!',
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 14),
            ),
          ),
          Text(
            'James Butler',
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    ],
  );
}