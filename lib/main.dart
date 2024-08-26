import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/features/auth/presentation/manager/otp_email_bloc/otp_email_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_bloc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';
import 'package:Learn_U/main_screen.dart';
import 'package:Learn_U/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/routs_manager.dart';
import 'package:Learn_U/core/service/navigation_service.dart';
import 'package:Learn_U/core/service/service_locator.dart';
import 'package:Learn_U/core/translations/codegen_loader.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/translation_login_userdata_provider.dart';
import 'features/Search_Page/presentation/manager/search_bloc/search_bloc.dart';
import 'features/auth/presentation/manager/countries_bloc/countries_bloc.dart';
import 'features/auth/presentation/manager/forget_password_bloc/forget_password_bloc.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';
import 'features/category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import 'features/category/Presentation/Manager/trainers_bloc/trainers_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServerLocator().init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final user_email = prefs.getString("user_email") ?? 'false';

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      assetLoader: const CodegenLoader(),
      path: 'lib/core/translations/',
      child: MyApp(
        user_email: user_email,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.user_email});
  final String user_email;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<RegisterBloc>()),
          BlocProvider(create: (context) => getIt<LoginBloc>()),
          BlocProvider(create: (context) => getIt<ForgetPasswordBloc>()),
          BlocProvider(create: (context) => getIt<OtpEmailBloc>()),
          BlocProvider(create: (context) => getIt<CountriesBloc>()),
          BlocProvider(create: (context) => getIt<CategoriesDataBloc>()),
          BlocProvider(create: (context) => getIt<ProfileBloc>()),
          BlocProvider(create: (context) => getIt<SearchBloc>()),
          BlocProvider(create: (context) => getIt<TrainersDataBloc>()),
          BlocProvider(create: (context) => getIt<CourseDetailsDataBloc>()),
          ChangeNotifierProvider(
              create: (context) =>
                  TranslationLoginUserDataProvider(user_email)),
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
          home: WelcomeScreen(),
        ));
  }
  // main
}
