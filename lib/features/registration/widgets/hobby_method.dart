import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/custome_size_box.dart';


Row buildRowCheckBox(String hobby1, String hobby2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      buildHobbyCheck(hobby1),
      buildWidthSizedBox(50),
      buildHobbyCheck(hobby2),
    ],
  );
}

Row buildHobbyCheck(String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        checkColor: ThemeHelper.primaryColors,
        fillColor: WidgetStateProperty.all(Colors.transparent),

        value: false,
        onChanged: (value) {},
      ),
      buildDefaultHobbyText(text: name),
    ],
  );
}


Widget buildDefaultHobbyText({required String text}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: ThemeHelper.secondaryColors,
      ),
    ),
  );
}