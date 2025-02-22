import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/shared/exception/base_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IStockRepository {
  Future<Result<List<StockModel>, APIException>> getStockBySearch({
    required String query,
  });
  Future<Result<StockModel, APIException>> getStocksById({
    required int stockId,
  });
  Future<Result<Map<String, dynamic>, APIException>> getStockPriceGraphById({
    required int stockId,
    required String range,
  });
}
