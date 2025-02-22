import 'package:auto_route/auto_route.dart';
import 'package:capricon_stock/core/router/guards/login_guard.dart';
import 'package:capricon_stock/core/router/guards/splash_guard.dart';
import 'package:capricon_stock/core/router/router.gr.dart';
import 'package:capricon_stock/data/service/login_db/login_db_service.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final LoginDbService loginDbService;
  AppRouter({
    required this.loginDbService,
  });
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: CounterRoute.page,
      path: '/counter',
      // initial: true,
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      guards: [LoginGuard(loginDbService: loginDbService)],
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/',
      initial: true,
      guards: [SplashGuard(loginDbService: loginDbService)],
    ),
    AutoRoute(
      page: StocksDetailsRoute.page,
      path: '/stock-details',
    ),
  ];
}
