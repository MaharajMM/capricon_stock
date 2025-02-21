import 'package:auto_route/auto_route.dart';
import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/const/resource.dart';
import 'package:capricon_stock/core/router/router.gr.dart';
import 'package:capricon_stock/features/login/const/login_keys.dart';
import 'package:capricon_stock/features/login/controller/login_pod.dart';
import 'package:capricon_stock/features/login/state/login_state.dart';
import 'package:capricon_stock/features/login/view/widgets/login_button.dart';
import 'package:capricon_stock/shared/utilities/utilites.dart';
import 'package:capricon_stock/shared/widget/custom_text_formfield.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _loginFormKey = GlobalKey<FormBuilderState>();
  void login() {
    if (_loginFormKey.currentState?.validate() ?? false) {
      HapticFeedback.lightImpact();
      Feedback.forTap(context);
      final fields = _loginFormKey.currentState!.fields;
      final username = fields[LoginKeys.userName]!.value as String;
      final password = fields[LoginKeys.password]!.value as String;

      ref.read(loginProvider.notifier).loginUser(
            userName: username,
            passWord: password,
            onLoginVerified: () {
              context.showToast(msg: 'Success', bgColor: AppColors.kSuccessColor.withOpacity(0.8));
              context.router.replaceAll([const HomeRoute()]);
            },
          );
    } else {
      return Utilities.flushBarErrorMessage(message: "Not validated", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next.value is NotVerifiedState) {
          Utilities.flushBarErrorMessage(
              message: 'Unable to verify at this time. Please try later', context: context);
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Spacer(),
          AppText(
            text: 'Login',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          AppText(
            text: 'Hello there,Login to continue',
            color: AppColors.grey400,
          ),

          40.heightBox,
          SvgPicture.asset(R.ASSETS_IMAGES_LOGIN_SVG),
          40.heightBox,
          Expanded(
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                FormBuilder(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Username',
                        hintText: 'Username',
                        name: LoginKeys.userName,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: 'Enter Username'),
                        ]),
                      ),
                      20.heightBox,
                      CustomTextFormField(
                        textInputAction: TextInputAction.done,
                        labelText: 'Password',
                        hintText: 'Password',
                        name: LoginKeys.password,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: 'PassWord Required'),
                        ]),
                      ),
                      10.heightBox,
                    ],
                  ).pOnly(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                ),
                20.heightBox,
                LoginButton(onLogin: login).pOnly(left: 24, right: 24),
              ],
            ),
          ),
        ],
      ).p12(),
    );
  }
}
