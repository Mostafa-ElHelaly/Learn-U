import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../core/resource_manger/routs_manager.dart';
import '../../../core/widgets/main_button.dart';

class ProfileScreenBrowse extends StatefulWidget {
  const ProfileScreenBrowse({super.key});

  @override
  State<ProfileScreenBrowse> createState() => _ProfileScreenBrowseState();
}

class _ProfileScreenBrowseState extends State<ProfileScreenBrowse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          StringManager.signUpWithUs.tr(),
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
              title: StringManager.signUpWithUs.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
