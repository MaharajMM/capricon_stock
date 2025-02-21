import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/features/login/controller/login_pod.dart';
import 'package:capricon_stock/features/login/state/login_state.dart';
import 'package:capricon_stock/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:capricon_stock/shared/widget/primary_action_button.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginButton extends ConsumerWidget {
  final VoidCallback onLogin;
  const LoginButton({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStateAsync = ref.watch(loginProvider);
    return loginStateAsync.easyWhen(
      data: (loginState) {
        return switch (loginState) {
          InitialLoginState() => PrimaryActionButton(
              labelText: 'Login',
              onPressed: onLogin,
            ),
          VerifyingLoginState() => const PrimaryActionButton(
              isLoading: true,
              labelText: 'Verifying',
              onPressed: null,
            ),
          VerifiedState() => PrimaryActionButton(
              labelText: 'Verified Login',
              onPressed: () {},
            ),
          NotVerifiedState() => PrimaryActionButton(
              labelText: 'Unable to verify',
              onPressed: onLogin,
            ),
          LoginErrorState() => Column(
              children: [
                AppText(
                  text: loginState.message,
                  color: AppColors.kErrorColor,
                ),
                8.heightBox,
                PrimaryActionButton(
                  labelText: 'Retry',
                  onPressed: onLogin,
                ),
              ],
            ),
        };
      },
    );
  }
}
