import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'component/edit_my_profile/edit_my_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const EditMyProfileScreen(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  child: Row(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yehia Mostafa",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ConfigSize.defaultSize! * 1.7,
                            ),
                          ),
                          SizedBox(
                            height: ConfigSize.defaultSize! * .5,
                          ),
                          Text(
                            StringManager.editMyProfile.tr(),
                          ),
                        ],
                      ),
                      const Spacer(),

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 2),
                  child: Container(
                    width: ConfigSize.screenHeight!,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),

              ],
            ),




            SizedBox(
              height: ConfigSize.defaultSize! * 2,
            ),
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const LoginScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              child: Container(
                width: ConfigSize.screenWidth!,
                height: ConfigSize.defaultSize! * 5,
                decoration: BoxDecoration(
                  color: ColorManager.kPrimaryBlueDark,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.logOut.tr(),
                      style: TextStyle(
                          color: ColorManager.whiteColor,
                          fontSize: ConfigSize.defaultSize! * 1.8,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
