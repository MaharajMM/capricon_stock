import 'dart:async';

import 'package:capricon_stock/data/repository/stock/stock_repository_pod.dart';
import 'package:capricon_stock/features/stocks_details/state/stock_price_graph_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockPriceGraphNotifier extends AutoDisposeAsyncNotifier<StockPriceGraphState> {
  @override
  FutureOr<StockPriceGraphState> build() {
    return const InitialStockPriceGraphState();
  }

  Future<void> getStockPriceGraph({
    required String range,
    required int stockId,
    required void Function(Map<String, dynamic>) onGettingStock,
  }) async {
    state = const AsyncData(SearchingStockPriceGraphState());
    state = await AsyncValue.guard(
      () async {
        final result = await ref.watch(stockRepoProvider).getStockPriceGraphById(
              stockId: stockId,
              range: range,
            );

        return result.when(
          (stockModel) {
            if (stockModel.isNotEmpty) {
              onGettingStock(stockModel);
              return const StockPriceGraphSuccessState();
            } else {
              return StockPriceGraphErrorState('No stock found');
            }
          },
          (error) => StockPriceGraphErrorState(error.errorMessage),
        );
      },
    );
  }
}
