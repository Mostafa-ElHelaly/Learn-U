import 'package:dartz/dartz.dart';

import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';

abstract class BaseRepositorySearch {
  Future<Either<List<SearchModel>, Failure>> getSearch();
}
