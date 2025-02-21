import 'package:auto_route/auto_route.dart';
import 'package:capricon_stock/core/router/router.gr.dart';
import 'package:capricon_stock/data/service/login_db/login_db_service.dart';

class LoginGuard extends AutoRouteGuard {
  final LoginDbService loginDbService;

  LoginGuard({required this.loginDbService});

  @override

  /// A class that provides database services for token management.
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = loginDbService.getLoginToken();
    if (token != null) {
      resolver.next(true);
    } else {
      router.replaceAll([const LoginRoute()]);
      resolver.next(false);
    }
  }
}
