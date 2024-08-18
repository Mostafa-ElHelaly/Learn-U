import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/Search_Page/domain/repo/base_repo.dart';
import 'package:dartz/dartz.dart';

import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/core/error/failure.dart';

class SearchUseCase extends BaseUseCase<List<SearchModel>, Noparamiter> {
  final BaseRepositorySearch baseRepository;

  SearchUseCase({required this.baseRepository});

  @override
  Future<Either<List<SearchModel>, Failure>> call(Noparamiter parameter) async {
    final result = await baseRepository.getSearch();

    return result;
  }
}
