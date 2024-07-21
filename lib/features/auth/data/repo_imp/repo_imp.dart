import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/api_helper.dart';
import '../../domain/repo/base_repo.dart';
import '../data_source/remotly_data_source.dart';

class RepositoryImp extends BaseRepository {
  final BaseRemotelyDataSource baseRemotelyDataSource;

  RepositoryImp({required this.baseRemotelyDataSource});

  @override
  Future<Either<RegisterModel, Failure>> RegisterWithEmailAndPassword(
      RegisterModel registerModel) async {
    try {
      final result = await baseRemotelyDataSource.RegisterWithEmailAndPassword(
          registerModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  // @override
  // Future<Either<LoginModel, Failure>> loginWithEmailAndPassword(AuthModel authModel) async {
  //   try {
  //     final result = await baseRemotelyDataSource.loginWithEmailAndPassword(authModel);
  //     return Left(result);
  //   } on Exception catch (e) {
  //     return right(DioHelper.buildFailure(e));
  //   }
  // }

  // @override
  // Future<Either<LoginModel, Failure>> signupWithEmailAndPassword(SignupAuthModel signupAuthModel) async {
  //   try {
  //     final result = await baseRemotelyDataSource.signupWithEmailAndPassword(signupAuthModel);
  //     return Left(result);
  //   } on Exception catch (e) {
  //     return right(DioHelper.buildFailure(e));
  //   }
  // }

  // @override
  // Future<Either<CountriesList, Failure>> getCountries() async {
  //   try {
  //     final result = await baseRemotelyDataSource.getCountries();
  //     return Left(result);
  //   } on Exception catch (e) {
  //     return right(DioHelper.buildFailure(e));
  //   }
  // }

  // @override
  // Future<Either<CitiesList, Failure>> getCities(CitiesAuthModel citiesAuthModel) async {
  //   try {
  //     final result = await baseRemotelyDataSource.getCities(citiesAuthModel);
  //     return Left(result);
  //   } on Exception catch (e) {
  //     return right(DioHelper.buildFailure(e));
  //   }
  // }
}
