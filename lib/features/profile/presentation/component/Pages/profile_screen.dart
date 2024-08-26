import 'package:Learn_U/core/service/translation_login_userdata_provider.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:Learn_U/features/profile/presentation/component/Pages/privacy_and_policy_screen.dart';
import 'package:Learn_U/features/profile/presentation/component/Pages/refund_policy.dart';
import 'package:Learn_U/features/profile/presentation/component/Pages/terms_and_conditions.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_event.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/resource_manger/routs_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(GetallUsersEvent());
    super.initState();
  }

  TextStyle textbuttonstyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: ConfigSize.defaultSize! * 1.5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          StringManager.myProfile.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: ConfigSize.defaultSize! * 2,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
          child: Consumer<TranslationLoginUserDataProvider>(
            builder: (context, user, child) {
              return BlocBuilder<ProfileBloc, UsersState>(
                builder: (context, state) {
                  if (state is UsersSuccessState) {
                    UserModel current_user = state.users
                        .where((element) =>
                            element.email! == user.current_user_email)
                        .toList()[0];
                    return Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorManager.gray2,
                              child: Icon(
                                Icons.person,
                                color: ColorManager.whiteColor,
                              ),
                              radius: ConfigSize.defaultSize! * 2.8,
                            ),
                            SizedBox(
                              width: ConfigSize.defaultSize! * 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi 👋',
                                ),
                                SizedBox(
                                  height: ConfigSize.defaultSize! * .5,
                                ),
                                Provider.value(
                                    value: user.current_user_email,
                                    child: Text(
                                      current_user.email!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: ConfigSize.defaultSize! * 1.2,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ConfigSize.defaultSize! * 10,
                        ),
                        MainButton(
                            onTap: () {
                              Future<void> Sign_out() async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('is_logged');
                              }

                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.login, (route) => false);
                            },
                            title: 'Logout'),
                        SizedBox(
                          height: ConfigSize.defaultSize! * 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: ConfigSize.defaultSize! * 10,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return PrivacyandPolicy();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    'Privacy and Policy',
                                    style: textbuttonstyle,
                                  )),
                            ),
                            Container(
                              width: ConfigSize.defaultSize! * 10,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return TermsandConditions();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    'Terms and Conditions',
                                    style: textbuttonstyle,
                                  )),
                            ),
                            Container(
                              width: ConfigSize.defaultSize! * 10,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return RefundPolicy();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    'Refund Policy',
                                    style: textbuttonstyle,
                                  )),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                  if (state is UsersErrorState) {
                    return Text('error');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.mainColor,
                      ),
                    );
                  }
                },
              );
            },
          )),
    );
  }
}
