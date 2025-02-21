import 'package:capricon_stock/const/app_urls.dart';
import 'package:capricon_stock/data/model/error_model.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:capricon_stock/data/model/login_model.dart';
import 'package:capricon_stock/shared/exception/base_exception.dart';

import 'i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  final Dio dio;
  LoginRepository({
    required this.dio,
  });
  @override
  Future<Result<LoginModel, APIException>> loginUser({
    required String userName,
    required String passWord,
  }) async {
    final result = await dio.post(
      AppUrls.loginUrl,
      data: {
        'identifier': userName,
        'password': passWord,
      },
    );
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(LoginModel.fromMap(result.data));
    } else {
      final errorModel = ErrorModel.fromMap(result.data);
      return Error(
        APIException(
          errorMessage: '${errorModel.error?.message}',
        ),
      );
    }
  }
}
