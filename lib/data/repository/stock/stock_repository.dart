import 'package:capricon_stock/const/app_urls.dart';
import 'package:capricon_stock/data/model/error_model.dart';
import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_stock_repository.dart';

class StockRepository implements IStockRepository {
  final Dio dio;

  StockRepository({required this.dio});
  @override
  Future<Result<List<StockModel>, APIException>> getStockBySearch({required String query}) async {
    try {
      final result = await dio.get(
        AppUrls.searchUrl,
        queryParameters: {'query': query},
      );

      if (result.statusCode == 200 || result.statusCode == 201) {
        // Assuming the response is a list of stocks
        final List<dynamic> data = result.data; // Ensure it's treated as a list
        List<StockModel> stocks = data.map((e) => StockModel.fromMap(e)).toList();

        return Success(stocks);
      } else {
        final errorModel = ErrorModel.fromMap(result.data);
        return Error(
          APIException(
            errorMessage: '${errorModel.error?.message}',
          ),
        );
      }
    } catch (e) {
      return Error(APIException(errorMessage: e.toString()));
    }
  }

  @override
  Future<Result<StockModel, APIException>> getStocksById({required int stockId}) async {
    try {
      final result = await dio.get(
        AppUrls.getStockByIdUrl(stockId: stockId.toString()),
      );

      if (result.statusCode == 200 || result.statusCode == 201) {
        return Success(StockModel.fromMap(result.data));
      } else {
        final errorModel = ErrorModel.fromMap(result.data);
        return Error(
          APIException(
            errorMessage: '${errorModel.error?.message}',
          ),
        );
      }
    } catch (e) {
      return Error(APIException(errorMessage: e.toString()));
    }
  }
}
