import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/api_helper.dart';
import '../../domain/repo/Categories_Base_Repository.dart';
import '../data_source/remotley_data_source.dart';

class CategoriesRepositoryImp extends CategoriesBaseRepository {
  final CategoryRemotelyDateSource baseRemotelyDataSource;

  CategoriesRepositoryImp({required this.baseRemotelyDataSource});

  @override
  Future<Either<List<CategoriesModel>, Failure>> getcategories() async {
    try {
      final result = await baseRemotelyDataSource.getCategories();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
