import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:default_project/features/registration/bloc/resgistration_event.dart';
import 'package:default_project/features/registration/bloc/resgistration_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/custome_size_box.dart';

Row buildRowCheckBox(String hobby1, bool value, Function(bool?) onChange) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side:
                  ThemeHelper.lightTheme.checkboxTheme.side ??
                  BorderSide(color: ThemeHelper.secondaryColors, width: 1.0),
            ),
            checkColor: ThemeHelper.lightTheme.checkboxTheme.checkColor
                ?.resolve({}),
            fillColor: ThemeHelper.lightTheme.checkboxTheme.fillColor,

            value: value,
            onChanged: onChange,
          ),
          buildDefaultHobbyText(text: hobby1),
        ],
      ),
    ],
  );
}
//
// Row buildHobbyCheck(String name,RegistrationState state,BuildContext context) {
//   return
// }

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
