import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/features/category/presentation/Categories_Page.dart';
import 'package:Learn_U/features/home/presentation/component/Courses/Courses_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'features/home/presentation/component/Search_Page/Search_Page.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/profile/presentation/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SearchPage(),
      const MyCoursesPage(),
      const CategoriesPage(),
      const ProfileScreen(),
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
          Icons.menu_book,
          color: ColorManager.kPrimaryBlueDark,
          size: 40,
        ),
        inactiveIcon: const Icon(
          Icons.menu_book,
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
      controller: _controller,
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
