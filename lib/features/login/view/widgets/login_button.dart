import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/shared/widget/primary_action_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginButton({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryActionButton(
      labelText: 'Login',
      fontColor: AppColors.grey400,
      onPressed: onLogin,
      color: AppColors.orange500,
    );
  }
}
