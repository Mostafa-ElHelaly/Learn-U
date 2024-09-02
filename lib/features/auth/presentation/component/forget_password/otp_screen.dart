import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/auth/presentation/component/forget_password/counter_by_minute.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/resource_manger/routs_manager.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../manager/register_bloc/register_bloc_event.dart';
import '../../manager/register_bloc/register_bloc_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key,
      required this.first_name,
      required this.middle_name,
      required this.last_name,
      required this.birthdate,
      required this.email,
      required this.password,
      required this.mobile,
      required this.country_id,
      required this.education,
      required this.token});
  final String first_name;
  final String middle_name;
  final String last_name;
  final String birthdate;
  final String email;
  final String password;
  final String mobile;
  final String country_id;
  final String education;
  final int token;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.login, (route) => false);
        } else if (state is RegisterErrorState) {
          errorSnackBar(context, state.errorMessage);
        } else if (state is RegisterLoadingState) {
          Center(
            child: CircularProgressIndicator(
              color: ColorManager.mainColor,
            ),
          );
        }
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
            AppLocalizations.of(context)!.otpscreen,
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
                AppLocalizations.of(context)!.pleaseenterthecode,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: ConfigSize.defaultSize! * 1.6,
                ),
              ),
              Text(
                widget.email,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ConfigSize.defaultSize! * 1.6,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ConfigSize.defaultSize! * 3,
                ),
                child: Pinput(
                  controller: pinController,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  length: 6,
                  defaultPinTheme: PinTheme(
                      width: ConfigSize.defaultSize! * 6,
                      height: ConfigSize.defaultSize! * 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(ConfigSize.defaultSize!),
                        border: Border.all(color: Colors.grey),
                      )),
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    return value != null ? null : 'Pin is incorrect';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                ),
              ),
              const CounterByMinute(),
              const SizedBox(
                height: 5,
              ),
              Text(
                AppLocalizations.of(context)!.resendcode,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ConfigSize.defaultSize! * 1.6,
                  color: ColorManager.mainColor,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
                child: MainButton(
                  onTap: () {
                    if (pinController.text == widget.token.toString()) {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(RegisterBlocEvent(
                        first_name: widget.first_name,
                        middle_name: widget.middle_name,
                        last_name: widget.last_name,
                        birthdate: widget.birthdate,
                        email: widget.email,
                        password: widget.password,
                        mobile: widget.mobile,
                        country_id: widget.country_id,
                        education: widget.education,
                      ));
                    } else {
                      errorSnackBar(context, 'Invalid OTP');
                    }
                  },
                  title: AppLocalizations.of(context)!.verify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
