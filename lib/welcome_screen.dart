import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/main_screen_browse.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'core/resource_manger/asset_path.dart';
import 'features/auth/presentation/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(0.0),

            colors: [
              ColorManager.mainColor,
              ColorManager.whiteColor,
            ], // Gradient colors
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, .6], // Stop values
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: ConfigSize.defaultSize! * 10),
            Padding(
              padding: EdgeInsets.only(bottom: ConfigSize.defaultSize! * 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    AssetsPath.logo,
                    filterQuality: FilterQuality.high,
                  ),
                  Text(
                    AppLocalizations.of(context)!.learninghasnolimts,
                    style: TextStyle(
                        fontSize: ConfigSize.defaultSize! * 2,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.gray2),
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 2),
                  Text(
                    AppLocalizations.of(context)!.welcometolearnu,
                    style: TextStyle(
                        fontSize: ConfigSize.defaultSize! * 2.5,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black),
                  ),
                ],
              ),
            ),
            // Spacer(
            //   flex: 1,
            // ),
            SizedBox(
              height: ConfigSize.defaultSize! * 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                            ColorManager.whiteColor), // Text color
                      ),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const LoginScreen(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.login)),
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                            ColorManager.whiteColor),
                      ),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const MainScreenBrowse(),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.browse)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
