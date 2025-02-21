import 'package:auto_route/auto_route.dart';
import 'package:capricon_stock/core/router/router.gr.dart';
import 'package:capricon_stock/data/service/login_db/login_db_service.dart';

class SplashGuard extends AutoRouteGuard {
  // final AuthState authState;
  final LoginDbService loginDbService;

  SplashGuard({
    required this.loginDbService,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final token = loginDbService.getLoginToken();

    if (token != null) {
      router.replaceAll([const HomeRoute()]);
      resolver.next(false);
    } else {
      resolver.next(true);
    }
  }
}
