import 'package:Learn_U/features/auth/data/model/CountriesModel.dart';
import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/presentation/component/forget_password/forget_password_screen.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/countries_model.dart';

abstract class BaseRepository {
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      LoginModel registerAuthModel);
  Future<Either<Map<String, dynamic>, Failure>> loginWithEmailAndPassword(
      LoginModel authModel);
  Future<Either<Unit, Failure>> forgetpassword(LoginModel resetPasswordModel);
  Future<Either<Map<String, dynamic>, Failure>> otpemail(
      LoginModel otpemailModel);
  Future<Either<List<CountriesModel>, Failure>> getcountries();
}
