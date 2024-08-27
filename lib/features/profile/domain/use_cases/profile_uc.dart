import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/base_repo.dart';

class ProfileUsecase extends BaseUseCase<List<UserModel>, Noparamiter> {
  final ProfileBaseRepository baseRepository;

  ProfileUsecase({required this.baseRepository});

  @override
  Future<Either<List<UserModel>, Failure>> call(Noparamiter params) async {
    final result = await baseRepository.getuser();

    return result;
  }
}
