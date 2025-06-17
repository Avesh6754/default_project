import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:flutter/material.dart';

class DreamVila extends StatelessWidget {
  const DreamVila({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeHelper.lightTheme,
      navigatorKey: NavigaterService.navigaterService,
      initialRoute: AppRoutes.initialRoutes,
      routes: AppRoutes.routes,
    );
  }
}
