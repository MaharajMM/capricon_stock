import 'dart:async';

import 'package:capricon_stock/data/repository/login/login_repository_pod.dart';
import 'package:capricon_stock/data/service/login_db/login_db_service_pod.dart';
import 'package:capricon_stock/features/login/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// **LoginAsyncNotifier**
/// Manages user login state using Riverpod's `AutoDisposeAsyncNotifier`.
///
/// This notifier handles:
/// - Performing login API calls.
/// - Managing authentication states.
/// - Storing JWT tokens in the local database.
/// - Handling errors gracefully.
class LoginAsyncNotifier extends AutoDisposeAsyncNotifier<LoginState> {
  /// Initializes the notifier with the initial login state.
  @override
  FutureOr<LoginState> build() {
    return const InitialLoginState();
  }

  /// Attempts to log in the user.
  ///
  /// - [userName]: The username entered by the user.
  /// - [passWord]: The password entered by the user.
  /// - [onLoginVerified]: Callback function executed when login is successful.
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
              // Save the JWT token in the local database
              await ref.read(loginDbProvider).saveLoginToken(jwtToken: loginModel.jwt);
              onLoginVerified();
              return const VerifiedState();
            } else {
              // If the token is empty, treat it as a failed login
              return const NotVerifiedState();
            }
          },
          // Handle API error response
          (error) => LoginErrorState(
            error.errorMessage,
          ),
        );
      },
    );
  }
}
