import 'package:Learn_U/features/auth/presentation/component/forget_password/otp_screen.dart';
import 'package:Learn_U/features/home/presentation/component/Pages/home_screen.dart';
import 'package:Learn_U/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';

class Routes {
  static const String login = "/LoginScreen";
  static const String createAccount = "/CreateAccount";
  static const String addDogInfoScreen = "/AddDogInfoScreen";
  static const String addDogImagesScreen = "/AddDogImagesScreen";
  static const String forgetPasswordScreen = "/ForgetPasswordScreen";
  static const String otpScreen = "/OtpScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String homeScreen = "/HomeScreen";
  static const String mainscreen = "/MainScreen";
  static const String serviceType = "/ServiceType";
  static const String viewAll = "/ViewAll";
  static const String matchingRequestScreen = "/MatchingRequestScreen";
  static const String editMyProfileScreen = "/EditMyProfileScreen";
  static const String editDogProfileScreen = "/EditDogProfileScreen";
}

class RouteGenerator {
  static String currentContext = '';

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        currentContext = Routes.login;
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());

      case Routes.homeScreen:
        currentContext = Routes.homeScreen;
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());

      case Routes.mainscreen:
        currentContext = Routes.mainscreen;
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MainScreen());
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Container(),
    );
  }
}
