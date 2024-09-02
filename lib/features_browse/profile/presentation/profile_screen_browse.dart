import 'package:Learn_U/core/resource_manger/asset_path.dart';
import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_bloc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../core/widgets/main_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreenBrowse extends StatefulWidget {
  const ProfileScreenBrowse({super.key});

  @override
  State<ProfileScreenBrowse> createState() => _ProfileScreenBrowseState();
}

class _ProfileScreenBrowseState extends State<ProfileScreenBrowse> {
  @override
  Widget build(BuildContext context) {
    String localetype = Methods.instance.fetch_current_languagecode(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.signupwithUs,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: ConfigSize.defaultSize! * 2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: ColorManager.mainColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: ConfigSize.defaultSize! * 20,
                          child: MainButton(
                              onTap: () {
                                context.read<LocaleBloc>().add(LocaleChanged(
                                    localetype == 'ar'
                                        ? Locale('en', '')
                                        : Locale('ar', '')));
                              },
                              title: localetype == 'en'
                                  ? AppLocalizations.of(context)!
                                      .translatetoarabic
                                  : AppLocalizations.of(context)!
                                      .translatetoenglish)),
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
            SizedBox(height: ConfigSize.defaultSize! * 2),
            MainButton(
              color: ColorManager.kPrimaryBlueDark,
              textColor: ColorManager.whiteColor,
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const LoginScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              title: AppLocalizations.of(context)!.signup,
            ),
          ],
        ),
      ),
    );
  }
}
