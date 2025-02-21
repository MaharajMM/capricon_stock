import 'package:capricon_stock/features/login/controller/notifier/login_notifier.dart';
import 'package:capricon_stock/features/login/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginAsyncNotifier, LoginState>(LoginAsyncNotifier.new);
