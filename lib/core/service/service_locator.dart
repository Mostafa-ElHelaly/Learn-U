import 'package:Learn_U/features/profile/data/data_source/remotly_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:Learn_U/core/service/navigation_service.dart';

import 'package:Learn_U/features/auth/data/data_source/remotly_data_source.dart';
import 'package:Learn_U/features/auth/data/repo_imp/repo_imp.dart';
import 'package:Learn_U/features/auth/domain/repo/base_repo.dart';
import 'package:Learn_U/features/auth/domain/use_cases/countries_uc.dart';
import 'package:Learn_U/features/auth/domain/use_cases/forget_pass_uc.dart';
import 'package:Learn_U/features/auth/domain/use_cases/login_uc.dart';
import 'package:Learn_U/features/auth/domain/use_cases/otp_email_uc.dart';
import 'package:Learn_U/features/auth/domain/use_cases/register_uc.dart';
import 'package:Learn_U/features/auth/presentation/manager/countries_bloc/countries_bloc.dart';
import 'package:Learn_U/features/auth/presentation/manager/forget_password_bloc/forget_password_bloc.dart';
import 'package:Learn_U/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:Learn_U/features/auth/presentation/manager/otp_email_bloc/otp_email_bloc.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';
import 'package:Learn_U/features/profile/data/repo_impl/repo_impl.dart';
import 'package:Learn_U/features/profile/domain/repo/base_repo.dart';
import 'package:Learn_U/features/profile/domain/use_cases/profile_uc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc
    getIt.registerLazySingleton(() => RegisterBloc(
          registerUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => LoginBloc(
          loginUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => ForgetPasswordBloc(
          forgetPasswordUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => CountriesBloc(
      countriesUseCase: getIt(),
        ));

    getIt.registerLazySingleton(() => OtpEmailBloc(
          OtpEmailUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => ProfileBloc(
          ProfileUseCase: getIt(),
        ));
    //use_case
    getIt.registerLazySingleton(() => RegisterUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => LoginUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => ForgetPasswordUseCase(baseRepository: getIt()));
    getIt
        .registerLazySingleton(() => CountriesUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => OtpEmailUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => ProfileUsecase(baseRepository: getIt()));

    //Remote Date
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<BaseProfileRemotelyDataSource>(
        () => ProfileRemotelyDateSource());

    //Repository Implementation
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<ProfileBaseRepository>(
        () => ProfileRepositoryImp(baseRemotelyDataSource: getIt()));

    // navigation service
    getIt.registerLazySingleton(() => NavigationService());
  }
}
