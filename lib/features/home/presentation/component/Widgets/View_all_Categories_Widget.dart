import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/main_screen_browse.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ViewAllCategoriesWidget extends StatelessWidget {
  const ViewAllCategoriesWidget({super.key, required this.controller});
  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: MainScreenBrowse(
            isCategory: true,
            second_controller: controller,
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 1),
        child: Text(
          StringManager.viewAll.tr(),
          style: const TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontSize: 13,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
