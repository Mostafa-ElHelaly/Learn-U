import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BaseRepository {
  Future<Either<LoginModel, Failure>> RegisterWithEmailAndPassword(
      LoginModel loginModel);

  Future<Either<Unit, Failure>> loginWithEmailAndPassword(LoginModel authModel);

}
