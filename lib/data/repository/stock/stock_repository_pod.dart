import 'package:capricon_stock/data/repository/stock/i_stock_repository.dart';
import 'package:capricon_stock/data/repository/stock/stock_repository.dart';
import 'package:capricon_stock/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockRepoProvider = Provider.autoDispose<IStockRepository>(
  (ref) {
    return StockRepository(dio: ref.watch(dioProvider));
  },
);
