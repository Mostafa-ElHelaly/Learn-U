import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/Categories_Base_Repository.dart';

class TrainersUsecase extends BaseUseCase<List<TrainersModel>, Noparamiter> {
  final CategoriesBaseRepository baseRepository;

  TrainersUsecase({required this.baseRepository});

  @override
  Future<Either<List<TrainersModel>, Failure>> call(Noparamiter params) async {
    final result = await baseRepository.gettrainers();

    return result;
  }
}
