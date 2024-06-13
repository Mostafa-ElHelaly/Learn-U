import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/routs_manager.dart';
import 'package:Learn_U/core/service/navigation_service.dart';
import 'package:Learn_U/core/service/service_locator.dart';
import 'package:Learn_U/core/translations/codegen_loader.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServerLocator().init();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      assetLoader: const CodegenLoader(),
      path: 'lib/core/translations/',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return MaterialApp(
      title: 'Be sure!',
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      navigatorKey: getIt<NavigationService>().navigatorKey,
      onGenerateRoute: RouteGenerator.getRoute,
      home: const LoginScreen(),
    );
  }
}

