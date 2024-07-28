import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BaseRepository {
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      LoginModel registerAuthModel);

  Future<Either<Unit, Failure>> loginWithEmailAndPassword(LoginModel authModel);

}
