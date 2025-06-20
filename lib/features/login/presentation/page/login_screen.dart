import 'package:default_project/core/utils/app_validation.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/features/login/bloc/login_bloc.dart';
import 'package:default_project/features/login/bloc/login_event.dart';
import 'package:default_project/features/login/bloc/login_state.dart';
import 'package:default_project/features/login/model/login_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/navigater_service.dart';
import '../../../registration/widgets/common_widgets.dart' hide logoImage;
import '../widgets/common.dart';

class LoginScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return const LoginScreen();
  }

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
GlobalKey<FormState> formKey=GlobalKey<FormState>();
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
        body: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),

          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if(state.status)
                    {
                      NavigaterService.pushNamedRemovePreviousScreen(AppRoutes.homepage);
                    }
                },
                builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        buildHeightSizedBox(30),
                        Align(alignment: Alignment.center, child: logoImage()),
                        buildHeightSizedBox(10),
                        buildLoginDefaultText(text: 'Email'),
                        buildLoginDefaultTextField(
                          context: context,
                          label: 'dreamvila@gmail.com',
                          isEnabled: false,
                          controller: txtEmail,
                          keyboardType: TextInputType.text,
                          validator: AppValidations.validateEmail
                        ),
                        buildHeightSizedBox(10),
                        buildLoginDefaultText(text: 'Password'),
                        buildLoginDefaultTextField(
                          context: context,
                          label: 'Password',
                          event: LoginPasswordVisibilityEvent(),
                          isEnabled: true,
                          obscureText: state.isPasswordVisible,
                          controller: txtPassword,
                          keyboardType: TextInputType.text,
                          validator: AppValidations.validatePassword
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
                            LoginModal loginModal = LoginModal(
                              email: txtEmail.text,
                              password: txtPassword.text,
                            );
                            context.read<LoginBloc>().add(LoginInButtonEvent(loginModal: loginModal));
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
