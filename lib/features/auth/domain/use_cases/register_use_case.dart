import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/base_repo.dart';

class RegisterUseCase extends BaseUseCase<RegisterModel, RegisterModel> {
  BaseRepository baseRepository;

  RegisterUseCase({required this.baseRepository});

  @override
  Future<Either<RegisterModel, Failure>> call(RegisterModel parameter) async {
    final result = await baseRepository.RegisterWithEmailAndPassword(parameter);

    return result;
  }
}
