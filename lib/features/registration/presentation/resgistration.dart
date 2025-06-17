import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/registration/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_routes.dart';
import '../widgets/gender_radio.dart';
import '../widgets/hobby_method.dart';
import '../widgets/image_upload_resgistration.dart';
import '../widgets/signup_with_other.dart';

class Registration extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const Registration();
  }

  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ThemeHelper.backgroundColors,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeightSizedBox(30),
                  Align(alignment: Alignment.center, child: logoImage()),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'First Name'),
                  buildDefaultTextField(
                    isEnabled: false,
                    label: 'Name',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                  ),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'Last Name'),
                  buildDefaultTextField(
                    isEnabled: false,
                    label: 'Name',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                  ),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'Email Id '),
                  buildDefaultTextField(
                    isEnabled: false,
                    label: 'dreamvila@gmail.com',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                  ),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'Mobile'),
                  buildDefaultTextField(
                    isEnabled: false,
                    label: '+91',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                  ),
                  buildHeightSizedBox(10),
                  buildGenderRadio(),
                  buildDefaultText(text: 'Upload User Profile'),
                  buildHeightSizedBox(10),
                  Align(
                    alignment: Alignment.center,
                    child: buildImageUploadContainer(),
                  ),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'Password'),
                  buildDefaultTextField(
                    isEnabled: true,
                    label: 'Password',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'Confirm Password'),
                  buildDefaultTextField(
                    isEnabled: true,
                    label: 'Confirm Password',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                  buildHeightSizedBox(10),
                  buildDefaultText(text: 'Hobby'),
                  Column(
                    children: [
                      buildRowCheckBox('Reading', 'Drawing'),
                      buildRowCheckBox('Writing', 'Travelling'),
                    ],
                  ),
                  buildHeightSizedBox(10),
                  ElevatedButton(
                    style: ThemeHelper.lightTheme.elevatedButtonTheme.style,
                    onPressed: () {
                      NavigaterService.pushNamedRemovePreviousScreen(
                        AppRoutes.homepage,
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: ThemeHelper.backgroundColors,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  buildHeightSizedBox(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDefaultText(text: 'Already have an account ?'),
                      GestureDetector(
                        onTap: () {
                          NavigaterService.pushNamedRemovePreviousScreen(
                            AppRoutes.login,
                          );
                        },
                        child: Text(
                          'Sign In',
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
                  buildDefaultSignUpWithOther(),
                  buildHeightSizedBox(41),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
