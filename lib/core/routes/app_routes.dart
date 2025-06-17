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


  static Map<String, WidgetBuilder> get routes => {
    initialRoutes: SplashScreen.builder,
    registration: Registration.builder,
    login: LoginScreen.builder,
    homepage:HomeScreen.builder,
    detailPage:DetailScreen.builder
  };
}
