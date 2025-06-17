import 'package:default_project/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';

class NavigaterService {
  static GlobalKey<NavigatorState> navigaterService =
      GlobalKey<NavigatorState>();

  static void pushNamedRemovePreviousScreen(String routeName, {bool routePredicate = false, dynamic arguments}) {
    navigaterService.currentState?.pushReplacement(
      PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: arguments),
        pageBuilder: (context, animation, secondaryAnimation) =>
            AppRoutes.routes[routeName]!(context),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  (route) => routePredicate;
  }
  static void pushNextPage(String routeName, { dynamic arguments}) {
    navigaterService.currentState?.push(
      PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: arguments),
        pageBuilder: (context, animation, secondaryAnimation) =>
            AppRoutes.routes[routeName]!(context),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
  static void backPage(String routeName, { dynamic arguments}) {
    navigaterService.currentState?.pop(routeName);
  }
}
