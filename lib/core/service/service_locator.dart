import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/send_review_bloc/send_review_bloc.dart';
import 'package:Learn_U/features/category/domain/use_cases/course_details_uc.dart';
import 'package:Learn_U/features/category/domain/use_cases/get_reviews_uc.dart';
import 'package:Learn_U/features/category/domain/use_cases/send_review_uc.dart';
import 'package:Learn_U/features/profile/data/data_source/locale_data_source.dart';
import 'package:Learn_U/features/profile/data/data_source/remotly_data_source.dart';
import 'package:Learn_U/features/profile/data/repo_impl/locale_impl.dart';
import 'package:Learn_U/features/profile/domain/repo/locale_repository.dart';
import 'package:Learn_U/features/profile/domain/use_cases/translate_uc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:Learn_U/core/service/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/Search_Page/data/data_source/remotly_data_source.dart';
import '../../features/Search_Page/data/repo_imp/repo_imp.dart';
import '../../features/Search_Page/domain/repo/base_repo.dart';
import '../../features/Search_Page/domain/use_cases/search_uc.dart';
import '../../features/Search_Page/presentation/manager/search_bloc/search_bloc.dart';
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
import '../../features/category/Presentation/Manager/trainers_bloc/trainers_bloc.dart';
import '../../features/category/data/data_source/remotley_data_source.dart';
import '../../features/category/data/repo_impl/repo_impl.dart';
import '../../features/category/domain/repo/Categories_Base_Repository.dart';
import '../../features/category/domain/use_cases/categories_uc.dart';
import '../../features/category/domain/use_cases/trainers_uc.dart';
import '../../features/profile/data/repo_impl/repo_impl.dart';
import '../../features/profile/domain/repo/base_repo.dart';
import '../../features/profile/domain/use_cases/profile_uc.dart';
import '../../features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';

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
    getIt.registerLazySingleton(() => CategoriesDataBloc(
          categoriesUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => SearchBloc(
          searchUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => TrainersDataBloc(
          trainersUsecase: getIt(),
        ));
    getIt.registerLazySingleton(() => CourseDetailsDataBloc(
          categoriesUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => LocaleBloc(
          localeService: getIt(),
        ));
    getIt.registerLazySingleton(() => GetReviewsBloc(
          getreviewsUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => SendReviewsBloc(
          sendreviewsUseCase: getIt(),
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
    getIt.registerLazySingleton(
        () => CategoriesUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => SearchUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => TrainersUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => CourseDetailsUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => ChangeLocaleUseCase(localeRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetReviewsUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => SendReviewUsecase(baseRepository: getIt()));
    //Remote Date
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<BaseProfileRemotelyDataSource>(
        () => ProfileRemotelyDateSource());
    getIt.registerLazySingleton<BaseCategoriesRemotelyDataSource>(
        () => CategoryRemotelyDateSource());
    getIt.registerLazySingleton<BaseSearchRemotelyDataSource>(
        () => SearchRemotelyDateSource());
    getIt.registerLazySingleton<BaseLocaleDataSource>(() => LocaleDataSource());

    //Repository Implementation
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<ProfileBaseRepository>(
        () => ProfileRepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<CategoriesBaseRepository>(
        () => CategoriesRepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<BaseRepositorySearch>(
        () => RepositoryImpSearch(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<LocaleRepository>(
        () => LocaleRepositoryImpl(getIt()));

    // navigation service
    getIt.registerLazySingleton(() => NavigationService());
  }
}
