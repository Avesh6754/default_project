import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/custome_size_box.dart';

Column logoImage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildHeightSizedBox(20),
      Image(
        image: AssetImage('assets/jpg/logo.jpg'),
        height: 60,
        width: 250,
      ),
      buildHeightSizedBox(20),
      Text(
        'Sign In',
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

Widget buildLoginDefaultTextField({
  required String label,
  required bool isEnabled,
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool obscureText = false,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10,left: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: (isEnabled)?IconButton(onPressed: () {

        }, icon: Icon(Icons.remove_red_eye_outlined,color: ThemeHelper.textFieldColors,)):null,
        hintText: label,
        hintStyle:ThemeHelper.lightTheme.inputDecorationTheme.labelStyle ,
        border: ThemeHelper.lightTheme.inputDecorationTheme.border,
      ),

      validator: validator,
    ),
  );
}

Widget buildLoginDefaultText({required String text})
{
  return Padding(
    padding: const EdgeInsets.only(right: 10,left: 10),
    child: Text(
        text,
        style: GoogleFonts.lato(textStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: ThemeHelper.secondaryColors
        ),)
    ),
  );
}

Row buildLoginDefaultSignUpWithOther() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 10,
    children: [
      Expanded(
        child: Divider(
          color: ThemeHelper.secondaryColors,
          height: 0.80,
          indent: 70,
          endIndent: 0,
        ),
      ),
      Image(
        image: AssetImage('assets/png/search.png'),
        height: 20,
        width: 20,
      ),
      Image(
        image: AssetImage('assets/png/facebook.png'),
        height: 20,
        width: 20,
      ),
      Image(
        image: AssetImage('assets/png/twitter.png'),
        height: 20,
        width: 20,
      ),
      Expanded(
        child: Divider(
          height: 0.80,
          indent: 0,
          endIndent: 70,
          color: ThemeHelper.secondaryColors,
        ),
      ),
    ],
  );
}