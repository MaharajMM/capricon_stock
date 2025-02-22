import 'package:capricon_stock/data/service/login_db/i_login_db_service.dart';
import 'package:capricon_stock/shared/api_client/dio/default_api_error_handler.dart';
import 'package:dio/dio.dart';

// coverage:ignore-file

///This one is default interceptor which includes default api
///error handler
class DefaultAPIInterceptor extends Interceptor {
  DefaultAPIInterceptor({
    required this.dio,
    required this.loginDbService,
  });
  final Dio dio;
  final ILoginDbService loginDbService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _handleDefaultRequest(options, handler);
  }

  void _handleDefaultRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final jwtToken = loginDbService.getLoginToken();
    bool includeAuthToken = true;

    Map<String, dynamic> requestHeaders = {
      'x-api-mode': 'mob-app',
    };

    if (includeAuthToken && jwtToken != null) {
      requestHeaders.putIfAbsent('Authorization', () => 'Bearer $jwtToken');
    }

    options.headers.addAll(requestHeaders);
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    defaultAPIErrorHandler(err, handler, dio);
  }
}
