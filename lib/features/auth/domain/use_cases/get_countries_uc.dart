import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/CountriesModel.dart';
import '../repo/base_repo.dart';

class CountriesUseCase extends BaseUseCase<CountriesList, Noparamiter> {
  BaseRepository baseRepository;

  CountriesUseCase({required this.baseRepository});

  @override
  Future<Either<CountriesList, Failure>> call(Noparamiter parameter) async {
    final result = await baseRepository.getCountries();

    return result;
  }
}


