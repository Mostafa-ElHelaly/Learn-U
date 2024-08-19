import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/features/courses/presentation/Courses_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'features/Search_Page/presentation/component/Search_Page.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'features_browse/Categories/Categories_Page.dart';
import 'features_browse/Search_Page/Search_Page.dart';
import 'features_browse/home/presentation/home_screen.dart';
import 'features_browse/profile/presentation/profile_screen_browse.dart';

class MainScreenBrowse extends StatefulWidget {
  const MainScreenBrowse({super.key, this.second_controller, this.isCategory});
  final PersistentTabController? second_controller;
  final bool? isCategory;

  @override
  State<MainScreenBrowse> createState() => _MainScreenBrowseState();
}

class _MainScreenBrowseState extends State<MainScreenBrowse> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreenBrowse(),
      const SearchPageBrowse(),
      const CategoriesPageBrowse(),
      const ProfileScreenBrowse(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home_outlined,
          color: ColorManager.kPrimaryBlueDark,
          size: 40,
        ),
        inactiveIcon: const Icon(
          Icons.home_outlined,
          size: 20,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.search,
          color: ColorManager.kPrimaryBlueDark,
          size: 40,
        ),
        inactiveIcon: const Icon(
          Icons.search,
          size: 20,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.category,
          color: ColorManager.kPrimaryBlueDark,
          size: 40,
        ),
        inactiveIcon: const Icon(
          Icons.category,
          size: 20,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.account_circle_outlined,
          color: ColorManager.kPrimaryBlueDark,
          size: 40,
        ),
        inactiveIcon: const Icon(
          Icons.account_circle_outlined,
          size: 20,
        ),
        activeColorPrimary: ColorManager.kPrimaryBlueDark,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller:
          widget.isCategory == true ? widget.second_controller : _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
