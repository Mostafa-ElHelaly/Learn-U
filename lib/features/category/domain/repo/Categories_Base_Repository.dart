import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class CategoriesBaseRepository {
  Future<Either<List<CategoriesModel>, Failure>> getcategories();
  Future<Either<List<TrainersModel>, Failure>> gettrainers();
}
