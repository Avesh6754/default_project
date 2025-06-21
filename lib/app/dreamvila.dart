import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/repository/create_product_api_repository.dart';
import 'package:default_project/core/repository/details_api.dart';
import 'package:default_project/core/repository/home_product_api_repository.dart';
import 'package:default_project/core/repository/login_api_repository.dart';
import 'package:default_project/core/repository/repositiry_api_data.dart';
import 'package:default_project/core/repository/update_api_repository.dart';
import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/storage/secures_storage.dart';

import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/image_picker_section.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/addproperty/bloc/addproperty_bloc.dart';
import 'package:default_project/features/detail/bloc/details_bloc.dart';
import 'package:default_project/features/home/bloc/home_bloc.dart';
import 'package:default_project/features/login/bloc/login_bloc.dart';
import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:default_project/features/splashscreen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DreamVila extends StatelessWidget {
  const DreamVila({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(AuthStorageService()),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            ProfileImage(),
            RegistrationRepository(apiClient: ApiClient()),
          ),
        ),
        BlocProvider(
          create: (context) => LoginBloc(LoginApiRepository(ApiClient())),
        ),
        BlocProvider(
          create: (context) =>
              AddPropertyBloc(CreateProductApiRepository(ApiClient()),UpdateRepository(ApiClient())),
        ),
        BlocProvider(
          create: (context) =>
              HomeBloc(HomeProductRepository(ApiClient())),
        ),
        BlocProvider(
          create: (context) =>
             DetailsBloc(DetailsApi(ApiClient())),
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
