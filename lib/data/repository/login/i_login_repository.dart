import 'package:capricon_stock/data/model/login_model.dart';
import 'package:capricon_stock/shared/exception/base_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILoginRepository {
  Future<Result<LoginModel, APIException>> loginUser({
    required String userName,
    required String passWord,
  });
}
