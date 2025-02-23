import 'dart:async';

import 'package:capricon_stock/data/model/stock_model.dart';
import 'package:capricon_stock/data/repository/stock/stock_repository_pod.dart';
import 'package:capricon_stock/features/home/state/stock_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Riverpod AsyncNotifier responsible for managing stock search state.
class SearchStockAsyncNotifier extends AutoDisposeAsyncNotifier<SearchStockState> {
  /// Initializes the notifier with an initial state.
  @override
  FutureOr<SearchStockState> build() {
    return const InitialSearchStockState();
  }

  /// Performs a stock search based on the given query.
  ///
  /// This method updates the state to `SearchingStockState`, fetches stock data
  /// from the repository, and updates the state accordingly.
  ///
  /// - [query]: The stock name to search for.
  /// - [onGettingStock]: A callback function that receives the list of fetched stocks.
  Future<void> searchstock({
    required String query,
    required void Function(List<StockModel> stockListModel) onGettingStock,
  }) async {
    // Set state to indicate the search is in progress
    state = const AsyncData(SearchingStockState());

    // Fetch stock data and handle the result
    state = await AsyncValue.guard(
      () async {
        final result = await ref.watch(stockRepoProvider).getStockBySearch(
              query: query,
            );

        // Process the response from the repository
        return result.when(
          (stockModel) {
            if (stockModel.isNotEmpty) {
              // Notify the caller with the fetched stock data
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
