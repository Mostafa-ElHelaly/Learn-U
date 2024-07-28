import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/base_repo.dart';

class RegisterUseCase extends BaseUseCase<Unit, LoginModel> {
  BaseRepository baseRepository;

  RegisterUseCase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(LoginModel parameter) async {
    final result = await baseRepository.registerWithEmailAndPassword(parameter);

    return result;
  }
}

class RegisterAuthModel {
  final String email;
  final String password;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String birthdate;
  final String education;
  final String countryId;
  final int mobile;

  RegisterAuthModel({
    required this.email,
    required this.password,
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.birthdate,
    required this.education,
    required this.countryId,
    required this.mobile,
  });
}
