import 'package:capricon_stock/core/local_storage/app_storage_pod.dart';
import 'package:capricon_stock/data/service/login_db/login_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginDbProvider = Provider.autoDispose<LoginDbService>(
  (ref) {
    return LoginDbService(appStorage: ref.watch(appStorageProvider));
  },
);
