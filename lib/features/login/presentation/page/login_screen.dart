import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/navigater_service.dart';
import '../../../registration/widgets/common_widgets.dart' hide logoImage;
import '../widgets/common.dart';

class LoginScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const LoginScreen();
  }

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),

        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                buildHeightSizedBox(30),
                Align(alignment: Alignment.center, child: logoImage()),
                buildHeightSizedBox(10),
                buildLoginDefaultText(text: 'Email'),
                buildLoginDefaultTextField(
                  label: 'dreamvila@gmail.com',
                  isEnabled: false,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                ), buildHeightSizedBox(10),
                buildLoginDefaultText(text: 'Password'),
                buildLoginDefaultTextField(
                  label: 'Password',
                  isEnabled: true,
                  obscureText: true,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password ?   ',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: ThemeHelper.primaryColors,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ),
                ),
                buildHeightSizedBox(30),
                ElevatedButton(
                  style: ThemeHelper.lightTheme.elevatedButtonTheme.style,
                  onPressed: () {
                    NavigaterService.pushNamedRemovePreviousScreen(
                      AppRoutes.homepage,
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: ThemeHelper.backgroundColors,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                buildHeightSizedBox(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDefaultText(text: '''Don't have an account ?'''),
                    GestureDetector(
                      onTap: () {
                        NavigaterService.pushNamedRemovePreviousScreen(
                          AppRoutes.registration,
                        );
                      },
                      child: Text(
                        ' Sign Up',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: ThemeHelper.primaryColors,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                buildHeightSizedBox(2),
                buildLoginDefaultSignUpWithOther(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
