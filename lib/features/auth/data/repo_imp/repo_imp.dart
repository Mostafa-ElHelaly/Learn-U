// import 'package:dartz/dartz.dart';
// import 'package:dinder/core/error/failure.dart';
// import 'package:dinder/core/utils/api_helper.dart';
// import 'package:dinder/features/auth/data/data_source/remotly_data_source.dart';
// import 'package:dinder/features/auth/data/model/auth_with_google_model.dart';
// import 'package:dinder/features/auth/data/model/cities_model.dart';
// import 'package:dinder/features/auth/data/model/countries_model.dart';
// import 'package:dinder/features/auth/data/model/login_model.dart';
// import 'package:dinder/features/auth/domain/repo/base_repo.dart';
// import 'package:dinder/features/auth/domain/use_case/login_uc.dart';
// import 'package:dinder/features/auth/domain/use_case/get_Cities_uc.dart';
//
// import '../../domain/use_case/signup_uc.dart';
//
// class RepositoryImp extends BaseRepository {
//   final BaseRemotelyDataSource baseRemotelyDataSource;
//
//   RepositoryImp({required this.baseRemotelyDataSource});
//
//   @override
//   Future<Either<AuthWithGoogleModel, Failure>> signWithGoogle() async {
//     try {
//       final result = await baseRemotelyDataSource.sigInWithGoogle();
//       return Left(result);
//     } on Exception catch (e) {
//       return Right(DioHelper.buildFailure(e));
//     }
//   }
//
//   @override
//   Future<Either<LoginModel, Failure>> loginWithEmailAndPassword(AuthModel authModel) async {
//     try {
//       final result = await baseRemotelyDataSource.loginWithEmailAndPassword(authModel);
//       return Left(result);
//     } on Exception catch (e) {
//       return right(DioHelper.buildFailure(e));
//     }
//   }
//
//   @override
//   Future<Either<LoginModel, Failure>> signupWithEmailAndPassword(SignupAuthModel signupAuthModel) async {
//     try {
//       final result = await baseRemotelyDataSource.signupWithEmailAndPassword(signupAuthModel);
//       return Left(result);
//     } on Exception catch (e) {
//       return right(DioHelper.buildFailure(e));
//     }
//   }
//
//
//   @override
//   Future<Either<CountriesList, Failure>> getCountries() async {
//     try {
//       final result = await baseRemotelyDataSource.getCountries();
//       return Left(result);
//     } on Exception catch (e) {
//       return right(DioHelper.buildFailure(e));
//     }
//   }
//
//
//   @override
//   Future<Either<CitiesList, Failure>> getCities(CitiesAuthModel citiesAuthModel) async {
//     try {
//       final result = await baseRemotelyDataSource.getCities(citiesAuthModel);
//       return Left(result);
//     } on Exception catch (e) {
//       return right(DioHelper.buildFailure(e));
//     }
//   }
// }