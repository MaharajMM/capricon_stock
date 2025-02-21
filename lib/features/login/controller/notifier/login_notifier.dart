import 'dart:async';

import 'package:capricon_stock/data/repository/login/login_repository_pod.dart';
import 'package:capricon_stock/features/login/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginAsyncNotifier extends AutoDisposeAsyncNotifier<LoginState> {
  @override
  FutureOr<LoginState> build() {
    return const InitialLoginState();
  }

  Future<void> loginUser({
    required String userName,
    required String passWord,
    required void Function() onLoginVerified,
  }) async {
    state = const AsyncData(VerifyingLoginState());
    state = await AsyncValue.guard(
      () async {
        final result = await ref.watch(loginRepoProvider).loginUser(
              userName: userName,
              passWord: passWord,
            );

        return result.when(
          (loginModel) async {
            if (loginModel.jwt.isNotEmpty) {
              onLoginVerified();
              return const VerifiedState();
            } else {
              return const NotVerifiedState();
            }
          },
          (error) => LoginErrorState(
            error.errorMessage,
          ),
        );
      },
    );
  }
}
