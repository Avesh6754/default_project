import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/storage/secures_storage.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/splashscreen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SplashBloc>().add(CheckIsLoginAurNot());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {

          if(state.currentState==SplashStatus.success)
            {
              NavigaterService.pushNamedRemovePreviousScreen(AppRoutes.homepage);

            }
          else if(state.currentState==SplashStatus.loading)
            {

            }
          else{
            NavigaterService.pushNamedRemovePreviousScreen(AppRoutes.login);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/jpg/logo.jpg'),
                  height: 300,
                  width: 300,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
