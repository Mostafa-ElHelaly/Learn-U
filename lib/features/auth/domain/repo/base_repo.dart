import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/domain/use_cases/get_countries_uc.dart';
import 'package:Learn_U/features/auth/presentation/component/forget_password/forget_password_screen.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/CountriesModel.dart';

abstract class BaseRepository {
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      LoginModel registerAuthModel);

  Future<Either<Unit, Failure>> loginWithEmailAndPassword(LoginModel authModel);

  Future<Either<Unit, Failure>> forgetpassword(LoginModel resetPasswordModel);

  Future<Either<CountriesList, Failure>> getCountries();
}
