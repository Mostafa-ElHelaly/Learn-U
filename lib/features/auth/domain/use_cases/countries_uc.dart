import 'package:Learn_U/features/auth/data/model/countries_model.dart';
import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/base_repo.dart';

class CountriesUsecase extends BaseUseCase<List<CountriesModel>, Noparamiter> {
  final BaseRepository baseRepository;

  CountriesUsecase({required this.baseRepository});

  @override
  Future<Either<List<CountriesModel>, Failure>> call(Noparamiter params) async {
    final result = await baseRepository.getcountries();

    return result;
  }
}
