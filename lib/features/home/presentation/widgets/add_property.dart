import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';
Row buildAddPropertyRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'jamesbutler@gmail.com',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 12,
            color: ThemeHelper.textFieldColors,
          ),
        ),
      ),
      Container(
        height: 39,
        width: 112,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffFFDFD0)),
        ),
        alignment: Alignment.center,
        child: Text(
          '+ Add Property',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: ThemeHelper.primaryColors),
          ),
        ),
      ),
    ],
  );
}