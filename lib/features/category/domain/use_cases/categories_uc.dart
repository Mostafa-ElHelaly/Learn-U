import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/Categories_Base_Repository.dart';

class CategoriesUsecase
    extends BaseUseCase<List<CategoriesModel>, Noparamiter> {
  final CategoriesBaseRepository baseRepository;

  CategoriesUsecase({required this.baseRepository});

  @override
  Future<Either<List<CategoriesModel>, Failure>> call(
      Noparamiter params) async {
    final result = await baseRepository.getcategories();

    return result;
  }
}
