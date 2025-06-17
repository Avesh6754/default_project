import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/splashscreen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return const SplashScreen();
  }

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      body: BlocProvider(
        create: (context) => SplashBloc(),
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            Future.delayed(Duration(seconds: 3), () {
              NavigaterService.pushNamedRemovePreviousScreen(AppRoutes.registration);
            });
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image(image: AssetImage('assets/jpg/logo.jpg',),height:300,width: 300,)],
              ),
            );
          },
        ),
      ),
    );
  }
}
