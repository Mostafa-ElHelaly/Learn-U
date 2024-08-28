import 'package:Learn_U/core/resource_manger/asset_path.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:Learn_U/features/profile/presentation/component/Pages/pricing_screen.dart';
import 'package:Learn_U/features/profile/presentation/component/Pages/privacy_and_policy_screen.dart';
import 'package:Learn_U/features/profile/presentation/component/Pages/refund_policy.dart';
import 'package:Learn_U/features/profile/presentation/component/Pages/terms_and_conditions.dart';
import 'package:Learn_U/features/profile/presentation/component/Widgets/CustomGesture.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_event.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_state.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_bloc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences prefs;
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(GetallUsersEvent());
    _initSharedPreferences();
    super.initState();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(
        () {}); // Ensure the state is updated after SharedPreferences is initialized
  }

  Future<void> Sign_out() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged', false) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    String localetype = Localizations.localeOf(context).languageCode;

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
          child: BlocBuilder<ProfileBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersSuccessState) {
                UserModel current_user = state.users
                    .where((element) =>
                        element.email! == prefs.getString("user_email"))
                    .toList()[0];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text(
                                  current_user.email!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: ConfigSize.defaultSize! * 1.2,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ConfigSize.defaultSize! * 2,
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: ColorManager.mainColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width: ConfigSize.defaultSize! * 20,
                                      child: MainButton(
                                          onTap: () {
                                            context.read<LocaleBloc>().add(
                                                LocaleChanged(localetype == 'ar'
                                                    ? Locale('en', '')
                                                    : Locale('ar', '')));
                                          },
                                          title: 'Translate')),
                                  Container(
                                    width: ConfigSize.defaultSize! * 3,
                                    height: ConfigSize.defaultSize! * 3,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              localetype == 'ar'
                                                  ? AssetsPath.english
                                                  : AssetsPath.arabic,
                                            ),
                                            fit: BoxFit.fill)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.defaultSize! * 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomGestureDetector(
                                context: context,
                                NavigatorPage: PrivacyandPolicy(),
                                title: 'Privacy and Policy'),
                            SizedBox(
                              height: ConfigSize.defaultSize! * 0.5,
                            ),
                            CustomGestureDetector(
                                context: context,
                                NavigatorPage: TermsandConditions(),
                                title: 'Terms and Conditions'),
                            SizedBox(
                              height: ConfigSize.defaultSize! * 0.5,
                            ),
                            CustomGestureDetector(
                                context: context,
                                NavigatorPage: RefundPolicy(),
                                title: 'Refund Policy'),
                            SizedBox(
                              height: ConfigSize.defaultSize! * 0.5,
                            ),
                            CustomGestureDetector(
                                context: context,
                                NavigatorPage: PrcicingScreen(),
                                title: 'Pricing'),
                          ],
                        ),
                        SizedBox(height: ConfigSize.defaultSize! * 2),
                        MainButton(
                            onTap: () {
                              Sign_out();
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: LoginScreen(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                              );
                            },
                            title: 'Logout'),
                      ],
                    ),
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
          )),
    );
  }
}
