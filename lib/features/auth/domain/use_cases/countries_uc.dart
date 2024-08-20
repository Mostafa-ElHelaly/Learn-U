import 'package:Learn_U/features/auth/data/model/countries_model.dart';
import 'package:dartz/dartz.dart';

import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/auth/domain/repo/base_repo.dart';

class CountriesUseCase extends BaseUseCase<List<CountriesModel>, Noparamiter> {
  final BaseRepository baseRepository;

  CountriesUseCase({required this.baseRepository});

  @override
  Future<Either<List<CountriesModel>, Failure>> call(Noparamiter parameter) async {
    final result = await baseRepository.getcountries();

    return result;
  }
}
