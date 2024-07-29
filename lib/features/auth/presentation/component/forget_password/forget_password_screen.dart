import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/custom_text_field.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/auth/presentation/component/forget_password/otp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/resource_manger/routs_manager.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../manager/forget_password_bloc/forget_password_bloc.dart';
import '../../manager/forget_password_bloc/forget_password_event.dart';
import '../../manager/forget_password_bloc/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
          } else if (state is ForgetPasswordErrorState) {
            errorSnackBar(context, state.errorMessage);
          } else if (state is ForgetPasswordLoadingState) {}
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.mainColor,
              ),
            ),
            centerTitle: true,
            title: Text(
              StringManager.forgetPassword2.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ConfigSize.defaultSize! * 2,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.forgetPasswordHint.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ConfigSize.defaultSize! * 1.5,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  StringManager.enterYourEmail.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.4,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 3),
                  child: MainButton(
                    onTap: () {
                      BlocProvider.of<ForgetPasswordBloc>(context).add(
                          ForgetPasswordEvent(email: emailController.text));
                    },
                    title: StringManager.sendCode.tr(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
