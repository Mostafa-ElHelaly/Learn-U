import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/Search_Page/data/data_source/remotly_data_source.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/Search_Page/domain/repo/base_repo.dart';
import 'package:dartz/dartz.dart';

import 'package:Learn_U/core/utils/api_helper.dart';


class RepositoryImpSearch extends BaseRepositorySearch {
  final BaseRemotelyDataSource baseRemotelyDataSource;

  RepositoryImpSearch({required this.baseRemotelyDataSource});



  @override
  Future<Either<List<SearchModel>, Failure>> getSearch() async {
    try {
      final result = await baseRemotelyDataSource.getSearch();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }




}
