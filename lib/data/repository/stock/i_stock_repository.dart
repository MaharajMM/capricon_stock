import 'package:capricon_stock/data/model/stock_list_model.dart';
import 'package:capricon_stock/shared/exception/base_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IStockRepository {
  Future<Result<List<StockModel>, APIException>> getStockBySearch({
    required String query,
  });
}
