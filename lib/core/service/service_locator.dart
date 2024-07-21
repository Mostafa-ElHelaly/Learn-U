import 'package:get_it/get_it.dart';
import 'package:Learn_U/core/service/navigation_service.dart';

import '../../features/auth/data/data_source/remotly_data_source.dart';
import '../../features/auth/data/repo_imp/repo_imp.dart';
import '../../features/auth/domain/repo/base_repo.dart';
import '../../features/auth/domain/use_cases/register_use_case.dart';
import '../../features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc
    getIt.registerLazySingleton(() => RegisterBloc(
          registerUseCase: getIt(),
        ));

    //use_case
    getIt.registerLazySingleton(() => RegisterUseCase(baseRepository: getIt()));

    //Remote Date
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());

    //Repository Implementation
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));

    // navigation service
    getIt.registerLazySingleton(() => NavigationService());
  }
}
