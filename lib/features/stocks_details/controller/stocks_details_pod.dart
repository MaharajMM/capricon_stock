import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/data/repository/stock/stock_repository_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stocksDetailsProvider =
    FutureProvider.autoDispose.family<StockModel, int>((ref, stockId) async {
  final result = await ref.watch(stockRepoProvider).getStocksById(stockId: stockId);
  return result.when(
    (stockDetailsModel) => stockDetailsModel,
    (error) => throw (error.errorMessage),
  );
});
