import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/base_repo.dart';

class OtpEmailUsecase extends BaseUseCase<Unit, LoginModel> {
  BaseRepository baseRepository;

  OtpEmailUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(LoginModel parameter) async {
    final result = await baseRepository.otpemail(parameter);

    return result;
  }
}
