import 'package:Learn_U/features/profile/data/data_source/remotly_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:Learn_U/core/service/navigation_service.dart';
import '../../features/auth/data/data_source/remotly_data_source.dart';
import '../../features/auth/data/repo_imp/repo_imp.dart';
import '../../features/auth/domain/repo/base_repo.dart';
import '../../features/auth/domain/use_cases/countries_uc.dart';
import '../../features/auth/domain/use_cases/forget_pass_uc.dart';
import '../../features/auth/domain/use_cases/login_uc.dart';
import '../../features/auth/domain/use_cases/otp_email_uc.dart';
import '../../features/auth/domain/use_cases/register_uc.dart';
import '../../features/auth/presentation/manager/countries_bloc/countries_bloc.dart';
import '../../features/auth/presentation/manager/forget_password_bloc/forget_password_bloc.dart';
import '../../features/auth/presentation/manager/login_bloc/login_bloc.dart';
import '../../features/auth/presentation/manager/otp_email_bloc/otp_email_bloc.dart';
import '../../features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';
import '../../features/category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import '../../features/category/data/data_source/remotley_data_source.dart';
import '../../features/category/data/repo_impl/repo_impl.dart';
import '../../features/category/domain/repo/Categories_Base_Repository.dart';
import '../../features/category/domain/use_cases/categories_uc.dart';
import '../../features/profile/data/repo_impl/repo_impl.dart';
import '../../features/profile/domain/repo/base_repo.dart';
import '../../features/profile/domain/use_cases/profile_uc.dart';
import '../../features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';

GetIt getIt = GetIt.instance;

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
          CountriesUseCase: getIt(),
        ));

    getIt.registerLazySingleton(() => OtpEmailBloc(
          OtpEmailUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => ProfileBloc(
          ProfileUseCase: getIt(),
        ));
    getIt.registerLazySingleton(
        () => CategoriesDataBloc(CategoriesUseCase: getIt()));
    //use_case
    getIt.registerLazySingleton(() => RegisterUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => LoginUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => ForgetPasswordUseCase(baseRepository: getIt()));
    getIt
        .registerLazySingleton(() => CountriesUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => OtpEmailUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => ProfileUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => CategoriesUsecase(baseRepository: getIt()));

    //Remote Date
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<BaseProfileRemotelyDataSource>(
        () => ProfileRemotelyDateSource());
    getIt.registerLazySingleton<BaseCategoriesRemotelyDataSource>(
        () => CategoryRemotelyDateSource());

    //Repository Implementation
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<ProfileBaseRepository>(
        () => ProfileRepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<CategoriesBaseRepository>(
        () => CategoriesRepositoryImp(baseRemotelyDataSource: getIt()));

    // navigation service
    getIt.registerLazySingleton(() => NavigationService());
  }
}
