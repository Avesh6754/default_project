import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';

Widget buildAddPropertyDefaultTextField({
  required String label,
  required bool isEnabled,
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool obscureText = false,
  bool isAddress=false,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10),
    child: TextFormField(
      maxLines:(isAddress)?3:1,
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
        hintStyle: ThemeHelper.lightTheme.inputDecorationTheme.hintStyle,
        border: ThemeHelper.lightTheme.inputDecorationTheme.border,
      ),

      validator: validator,
    ),
  );
}

Widget buildAddPropertyDefaultText({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10,bottom: 5),
    child: Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: ThemeHelper.secondaryColors,
        ),
      ),
    ),
  );
}