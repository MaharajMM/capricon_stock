import 'package:capricon_stock/features/home/controller/notifier/stock_notifier.dart';
import 'package:capricon_stock/features/home/state/stock_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchStockProvider =
    AsyncNotifierProvider.autoDispose<SearchStockAsyncNotifier, SearchStockState>(
        SearchStockAsyncNotifier.new);
