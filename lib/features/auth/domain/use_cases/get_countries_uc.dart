import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/countries_model.dart';
import '../repo/base_repo.dart';

class CountriesUseCase extends BaseUseCase<List<CountriesModel>, Noparamiter> {
  BaseRepository baseRepository;

  CountriesUseCase({required this.baseRepository});

  @override
  Future<Either<List<CountriesModel>, Failure>> call(
      Noparamiter parameter) async {
    final result = await baseRepository.getcountries();

    return result;
  }
}
