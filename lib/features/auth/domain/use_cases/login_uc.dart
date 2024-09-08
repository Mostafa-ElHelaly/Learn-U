import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/login_model.dart';
import '../repo/base_repo.dart';

class LoginUseCase extends BaseUseCase<Map<String, dynamic>, LoginModel> {
  BaseRepository baseRepository;

  LoginUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      LoginModel parameter) async {
    final result = await baseRepository.loginWithEmailAndPassword(parameter);

    return result;
  }
}

class AuthModel {
  final String email;
  final String password;

  AuthModel({required this.email, required this.password});
}
