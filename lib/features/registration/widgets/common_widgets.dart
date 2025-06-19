import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/custome_size_box.dart';
import '../bloc/resgistration_event.dart';



Widget buildDefaultTextField({
  required String label,
  required bool isEnabled,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required FocusNode node,
  bool obscureText = false,
  String? Function(String?)? validator,
  RegistrationEvent? event,
  required BuildContext context,

  // 👈 Pass event creator
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10),
    child: TextFormField(
      controller: controller,
      focusNode: node,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: (isEnabled)
            ? IconButton(
          onPressed: () {
            context.read<RegistrationBloc>().add(event!);

          },
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


Widget buildDefaultText({required String text}) {
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




