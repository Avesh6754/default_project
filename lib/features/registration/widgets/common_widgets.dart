import 'package:default_project/core/theme/theme_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/custome_size_box.dart';



Widget buildDefaultTextField({
  required String label,
  required bool isEnabled,
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool obscureText = false,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: (isEnabled)
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: ThemeHelper.textFieldColors,
                ),
              )
            : null,
        hintText: label,
        labelStyle: ThemeHelper.lightTheme.inputDecorationTheme.labelStyle,
        border: ThemeHelper.lightTheme.inputDecorationTheme.border,
      ),

      validator: validator,
    ),
  );
}

Widget buildDefaultText({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10),
    child: Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: ThemeHelper.secondaryColors,
        ),
      ),
    ),
  );
}


Column logoImage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildHeightSizedBox(20),
      Image(image: AssetImage('assets/jpg/logo.jpg'), height: 60, width: 250),
      buildHeightSizedBox(20),
      Text(
        'Sign Up',
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: ThemeHelper.primaryColors,
            fontSize: 32,
          ),
        ),
      ),
    ],
  );
}




