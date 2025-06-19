import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/repository/repositiry_api_data.dart';
import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/image_picker_section.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DreamVila extends StatelessWidget {
  const DreamVila({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationBloc(
            ProfileImage(),
            RegistrationRepository(apiClient: ApiClient()),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Dream Vila',
        debugShowCheckedModeBanner: false,
        theme: ThemeHelper.lightTheme,
        navigatorKey: NavigaterService.navigaterService,
        initialRoute: AppRoutes.initialRoutes,
        routes: AppRoutes.routes,
      ),
    );
  }
}
