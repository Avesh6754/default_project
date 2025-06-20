import 'package:default_project/features/addproperty/presentation/page/add_property_section.dart';
import 'package:default_project/features/detail/presentation/page/deatil_screen.dart';
import 'package:default_project/features/home/presentation/page/home_screen.dart';
import 'package:default_project/features/login/presentation/page/login_screen.dart';
import 'package:default_project/features/registration/presentation/resgistration.dart';
import 'package:default_project/features/splashscreen/presentation/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String initialRoutes = '/splashScreen';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String homepage = '/homePage';
  static const String detailPage = '/detailPage';
  static const String addPropertyPage = '/addPropertyPage';


  static Map<String, WidgetBuilder> get routes => {
    initialRoutes: SplashScreen.builder,
    registration: Registration.builder,
    login: LoginScreen.builder,
    homepage:HomeScreen.builder,
    detailPage:(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments;
      final id=(args is String)?args:" ";
      return DetailScreen(id: id);
    },
    addPropertyPage: AddPropertySection.builder,
  };
}
