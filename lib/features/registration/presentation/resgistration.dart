import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/app_validation.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:default_project/features/registration/bloc/resgistration_event.dart';
import 'package:default_project/features/registration/bloc/resgistration_state.dart';
import 'package:default_project/features/registration/model/registration_modal.dart';
import 'package:default_project/features/registration/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_routes.dart';
import '../../widgets/app_toast_message.dart';
import '../widgets/gender_radio.dart';
import '../widgets/hobby_method.dart';
import '../widgets/image_upload_resgistration.dart';
import '../widgets/signup_with_other.dart';

class Registration extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return const Registration();
  }

  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtMobile = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConfirmPassword = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  final List<String> _hobbies = ['Reading', 'Gaming', 'Traveling', 'Cooking'];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: ThemeHelper.backgroundColors,
        body: BlocConsumer<RegistrationBloc, RegistrationState>(

          listener: (context, state) {
            if (state.isLogin) {
              AppToast.show(
                message: 'Register Successfully',
              ); // your custom toast
              NavigaterService.pushNamedRemovePreviousScreen(
                AppRoutes.homepage,
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeightSizedBox(30),
                        Align(alignment: Alignment.center, child: logoImage()),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'First Name'),
                        buildDefaultTextField(
                          context: context,
                          validator: AppValidations.validateRequired,
                          node: firstNameFocus,
                          isEnabled: false,
                          label: 'First Name',
                          controller: txtFirstName,
                          keyboardType: TextInputType.text,
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Last Name'),
                        buildDefaultTextField(
                          context: context,
                          node: lastNameFocus,
                          validator: AppValidations.validateRequired,
                          isEnabled: false,
                          label: 'Last Name',
                          controller: txtLastName,
                          keyboardType: TextInputType.text,
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Email Id '),
                        buildDefaultTextField(
                          context: context,
                          node: emailFocus,
                          validator: AppValidations.validateEmail,
                          isEnabled: false,
                          label: 'dreamvila@gmail.com',
                          controller: txtEmail,
                          keyboardType: TextInputType.text,
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Mobile'),
                        buildDefaultTextField(
                          node: mobileFocus,
                          context: context,
                          validator: AppValidations.validateMobile,
                          isEnabled: false,
                          label: '+91',
                          controller: txtMobile,
                          keyboardType: TextInputType.number,
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Gender'),
                        buildGenderRadio(state, context),
                        buildDefaultText(text: 'Upload User Profile'),
                        buildHeightSizedBox(10),
                        Align(
                          alignment: Alignment.center,
                          child: buildImageUploadContainer(state, context),
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Password'),
                        buildDefaultTextField(
                          context: context,
                          validator: AppValidations.validatePassword,
                          isEnabled: true,
                          node: passwordFocus,
                          label: 'Password',
                          controller: txtPassword,
                          keyboardType: TextInputType.text,
                          obscureText: state.isPasswordVisible,
                          event: PasswordVisibilityEvent(),
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Confirm Password'),
                        buildDefaultTextField(
                          context: context,
                          node: confirmPasswordFocus,
                          isEnabled: true,
                          label: 'Confirm Password',
                          event: ConfirmPasswordVisibilityEvent(),
                          validator: (value) =>
                              AppValidations.validateConfirmPassword(
                                value,
                                txtPassword.text,
                              ),
                          controller: txtConfirmPassword,
                          keyboardType: TextInputType.text,
                          obscureText: state.isConfirmPasswordVisible,
                        ),
                        buildHeightSizedBox(10),
                        buildDefaultText(text: 'Hobby'),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 50,
                              children: [
                                buildRowCheckBox(
                                  _hobbies[0],
                                  state.hobbyList.contains(_hobbies[0]),
                                  (p0) {
                                    context.read<RegistrationBloc>().add(
                                      OnChangeHobbyEvent(_hobbies[0]),
                                    );
                                  },
                                ),
                                buildRowCheckBox(
                                  _hobbies[1],
                                  state.hobbyList.contains(_hobbies[1]),
                                  (p0) {
                                    context.read<RegistrationBloc>().add(
                                      OnChangeHobbyEvent(_hobbies[1]),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 43,
                              children: [
                                buildRowCheckBox(
                                  _hobbies[2],
                                  state.hobbyList.contains(_hobbies[2]),
                                  (p0) {
                                    context.read<RegistrationBloc>().add(
                                      OnChangeHobbyEvent(_hobbies[2]),
                                    );
                                  },
                                ),
                                buildRowCheckBox(
                                  _hobbies[3],
                                  state.hobbyList.contains(_hobbies[3]),
                                  (p0) {
                                    context.read<RegistrationBloc>().add(
                                      OnChangeHobbyEvent(_hobbies[3]),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        buildHeightSizedBox(10),
                        ElevatedButton(
                          style:
                              ThemeHelper.lightTheme.elevatedButtonTheme.style,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              RegistrationModal data = RegistrationModal(
                                hobby: state.hobbyList,
                                firstName: txtLastName.text,
                                lastName: txtLastName.text,
                                emailId: txtEmail.text,
                                mobile: double.parse(txtMobile.text),
                                gender: state.gender,
                                password: txtPassword.text,
                                image: state.image!,
                              );
                              context.read<RegistrationBloc>().add(
                                SignUpButtonEvent(data),
                              );
                            }
                          },
                          child: Text(
                            'Sign Up',
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
                            buildDefaultText(text: 'Already have an account?'),
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
                                    fontWeight: FontWeight.w400,
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
            );
          },
        ),
      ),
    );
  }
}
