// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:capricon_stock/features/counter/view/counter_page.dart'
    deferred as _i1;
import 'package:capricon_stock/features/home/view/home_page.dart' as _i2;
import 'package:capricon_stock/features/login/view/login_page.dart' as _i3;
import 'package:capricon_stock/features/stocks_details/view/stocks_details_page.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i5.PageRouteInfo<void> {
  const CounterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.CounterPage(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.StocksDetailsPage]
class StocksDetailsRoute extends _i5.PageRouteInfo<StocksDetailsRouteArgs> {
  StocksDetailsRoute({
    _i6.Key? key,
    required int stockId,
    String? stockImageUrl,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          StocksDetailsRoute.name,
          args: StocksDetailsRouteArgs(
            key: key,
            stockId: stockId,
            stockImageUrl: stockImageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'StocksDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StocksDetailsRouteArgs>();
      return _i4.StocksDetailsPage(
        key: args.key,
        stockId: args.stockId,
        stockImageUrl: args.stockImageUrl,
      );
    },
  );
}

class StocksDetailsRouteArgs {
  const StocksDetailsRouteArgs({
    this.key,
    required this.stockId,
    this.stockImageUrl,
  });

  final _i6.Key? key;

  final int stockId;

  final String? stockImageUrl;

  @override
  String toString() {
    return 'StocksDetailsRouteArgs{key: $key, stockId: $stockId, stockImageUrl: $stockImageUrl}';
  }
}
