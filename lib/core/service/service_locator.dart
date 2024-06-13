import 'package:get_it/get_it.dart';
import 'package:Learn_U/core/service/navigation_service.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {

    //bloc


    //use_case



    //Remote Date


    //Repository Implementation


    // navigation service
    getIt.registerLazySingleton(() => NavigationService());
  }
}
