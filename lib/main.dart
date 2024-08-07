import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/features/home/presentation/home_screen.dart';
import 'package:Learn_U/main_screen.dart';
import 'package:Learn_U/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/routs_manager.dart';
import 'package:Learn_U/core/service/navigation_service.dart';
import 'package:Learn_U/core/service/service_locator.dart';
import 'package:Learn_U/core/translations/codegen_loader.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/auth/presentation/manager/forget_password_bloc/forget_password_bloc.dart';
import 'features/auth/presentation/manager/get_countries_manager/get_countries_bloc.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<RegisterBloc>()),
          BlocProvider(create: (context) => getIt<LoginBloc>()),
          BlocProvider(create: (context) => getIt<ForgetPasswordBloc>()),
          BlocProvider(
            create: (context) => getIt<GetCountries>(),
          ),
        ],
        child: MaterialApp(
          title: 'Be sure!',
          debugShowCheckedModeBanner: false,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                  fontSize: ConfigSize.defaultSize! * 2.5,
                  fontWeight: FontWeight.bold)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  ColorManager.black), // Text color
            )),
            scaffoldBackgroundColor: ColorManager.whiteColor,
            canvasColor: ColorManager.whiteColor,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          navigatorKey: getIt<NavigationService>().navigatorKey,
          onGenerateRoute: RouteGenerator.getRoute,
          home: const WelcomeScreen(),
        ));
  }
// main
}
