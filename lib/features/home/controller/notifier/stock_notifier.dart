import 'dart:async';

import 'package:capricon_stock/data/model/stock_list_model.dart';
import 'package:capricon_stock/data/repository/stock/stock_repository_pod.dart';
import 'package:capricon_stock/features/home/state/stock_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchStockAsyncNotifier extends AutoDisposeAsyncNotifier<SearchStockState> {
  @override
  FutureOr<SearchStockState> build() {
    return const InitialSearchStockState();
  }

  Future<void> searchstock({
    required String query,
    required void Function(List<StockModel> stockListModel) onGettingStock,
  }) async {
    state = const AsyncData(SearchingStockState());
    state = await AsyncValue.guard(
      () async {
        final result = await ref.watch(stockRepoProvider).getStockBySearch(
              query: query,
            );

        return result.when(
          (stockModel) {
            if (stockModel.isNotEmpty) {
              onGettingStock(stockModel);
              return const SearchStockSuccessState();
            } else {
              return SearchStockErrorState('No stock found');
            }
          },
          (error) => SearchStockErrorState(error.errorMessage),
        );
      },
    );
  }
}
