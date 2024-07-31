import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/asset_path.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/custom_text_field.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/auth/presentation/component/create_account/create_account_screen.dart';
import 'package:Learn_U/features/auth/presentation/component/forget_password/forget_password_screen.dart';
import 'package:Learn_U/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/resource_manger/routs_manager.dart';
import '../../../core/widgets/snack_bar.dart';
import 'manager/login_bloc/login_bloc.dart';
import 'manager/login_bloc/login_event.dart';
import 'manager/login_bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.mainScreen, (route) => false);
        } else if (state is LoginErrorState) {
          errorSnackBar(context, state.errorMessage);
        } else if (state is LoginLoadingState) {}
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: ConfigSize.defaultSize! * 10,
            ),
            Image.asset(
              AssetsPath.logo,
            ),
            SizedBox(
              height: ConfigSize.defaultSize! * 4,
            ),
            Padding(
              padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.email.tr(),
                    style: TextStyle(
                      fontSize: ConfigSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! - 5,
                  ),
                  CustomTextField(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 2,
                  ),
                  Text(
                    StringManager.password.tr(),
                    style: TextStyle(
                      fontSize: ConfigSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! - 5,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    inputType: TextInputType.text,
                    obscureText: isVisible,
                    suffix: InkWell(
                        onTap: () {
                          {
                            isVisible = !isVisible;
                          }
                          setState(() {});
                        },
                        child: Icon(isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined)),
                  ),

                  SizedBox(
                    height: ConfigSize.defaultSize! * 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ForgetPasswordScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: Text(
                          StringManager.forgetPassword.tr(),
                          style: TextStyle(
                            fontSize: ConfigSize.defaultSize! * 1.6,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConfigSize.defaultSize! * 3),
                    child: MainButton(
                      color: ColorManager.kPrimaryBlueDark,
                      textColor: ColorManager.whiteColor,
                      onTap: () {
                        if (validation()) {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          errorSnackBar(context, StringManager.errorFillFields);
                        }
                      },
                      title: StringManager.login.tr(),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.dontHaveAccount.tr(),
                    style: const TextStyle(
                      color: ColorManager.gray,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const CreateAccount(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                        color: ColorManager.lightGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: ConfigSize.defaultSize! * 1.5,
                          horizontal: ConfigSize.defaultSize! * 3,
                        ),
                        child: Text(
                          StringManager.createAccount.tr(),
                          style: TextStyle(
                            color: ColorManager.kPrimaryBlueDark,
                            fontWeight: FontWeight.bold,
                            fontSize: ConfigSize.defaultSize! * 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
