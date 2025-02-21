import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:capricon_stock/const/colors/app_colors.dart';
import 'package:capricon_stock/const/resource.dart';
import 'package:capricon_stock/features/login/const/login_keys.dart';
import 'package:capricon_stock/features/login/view/widgets/login_button.dart';
import 'package:capricon_stock/shared/widget/custom_text_formfield.dart';
import 'package:capricon_stock/shared/widget/primary_action_button.dart';
import 'package:capricon_stock/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormBuilderState>();
  void login() {}

  @override
  Widget build(BuildContext context) {
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
                        // suffixIcon: _isObscure ? Icons.visibility : Icons.visibility_off,
                        labelText: 'password',
                        hintText: 'password',
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
                // ========== LOGIN API CALLED =========== //
                LoginButton(onLogin: login)
                    .h(MediaQuery.of(context).size.height * 0.05)
                    .pOnly(left: 24, right: 24),
                // GlobalButton(buttonText: 'Login', onPressed: login)
                10.heightBox,
                AppText(
                  text: 'OR',
                  textAlign: TextAlign.center,
                ),
                10.heightBox,
                PrimaryActionButton(
                  labelText: 'Login with OTP',
                  fontColor: AppColors.grey400,
                  onPressed: () {
                    // context.navigateTo(SigninMobileRoute());
                  },
                  color: AppColors.grey500.withOpacity(0.1),
                ).h(MediaQuery.of(context).size.height * 0.05).pOnly(left: 24, right: 24),
              ],
            ),
          ),
        ],
      ).p12(),
    );
  }
}
