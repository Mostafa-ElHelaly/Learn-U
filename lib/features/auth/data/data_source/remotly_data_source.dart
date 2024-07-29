import 'dart:math';

import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures_strings.dart';
import '../../../../core/utils/api_helper.dart';
import '../../../../core/utils/constant_api.dart';

abstract class BaseRemotelyDataSource {
  Future<Unit> registerWithEmailAndPassword(LoginModel registerAuthModel);

  Future<Unit> loginWithEmailAndPassword(LoginModel authModel);
  Future<Unit> forgetpassword(LoginModel resetPasswordModel);

// Future<AuthWithGoogleModel> sigInWithGoogle();

// Future<LoginModel> signupWithEmailAndPassword(SignupAuthModel signupAuthModel);

// Future<CitiesList> getCities(CitiesAuthModel citiesAuthModel);
// Future<CountriesList> getCountries();
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<Unit> registerWithEmailAndPassword(
      LoginModel registerAuthModel) async {
    final body = {
      "country_id": registerAuthModel.countryid,
      "first_name": registerAuthModel.firstname,
      "middle_name": registerAuthModel.middlename,
      "last_name": registerAuthModel.lastname,
      "email": registerAuthModel.email,
      "password": registerAuthModel.password,
      "mobile": registerAuthModel.mobile,
      "education": registerAuthModel.education,
      "birthdate": registerAuthModel.birthdate
    };

    print(body['country_id']);
    print(body['first_name']);
    print(body['middle_name']);
    print(body['last_name']);
    print(body['email']);
    print(body['password']);
    print(body['mobile']);
    print(body['education']);
    print(body['birthdate']);

    try {
      print("---------------");
      final response = await Dio().post(
        ConstantApi.register,
        data: body,
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );
      print("----${response.toString()}-----------");
      // log(response.data ?? '');
      if (response.statusCode == 200) {
        print('Registered Succesfully');
        return Future.value(unit);
      } else {
        throw Exception('Register Failed');
      }

      // Methods.instance.saveUserToken(authToken: authModelResponse.passwordToken);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "RegisterWithEmailAndPassword");
    }
  }

  @override
  Future<Unit> loginWithEmailAndPassword(LoginModel authModel) async {
    final body = {
      "email": authModel.email,
      "password": authModel.password,
    };

    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: FormData.fromMap(body),
      );
      if (response.statusCode == 200) {
        print('reset password success');
        return Future.value(unit);
      } else {
        throw Exception(Strings.resetPasswordFailed);
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<Unit> forgetpassword(LoginModel resetPasswordModel) async {
    final body = {
      "email": resetPasswordModel.email,
    };

    try {
      print("---------------");
      final response = await Dio().post(
        ConstantApi.forgetpassword,
        data: body,
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );
      if (response.statusCode == 200) {
        print('Reset Password Succesfully');
        return Future.value(unit);
      } else {
        throw Exception('Reset Password Failed');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "RegisterWithEmailAndPassword");
    }
  }
}

// class AuthRemotelyDateSource extends BaseRemotelyDataSource {
//   @override
//   Future<LoginModel> loginWithEmailAndPassword(AuthModel authModel) async {
//     final body = {"email": authModel.email, "password": authModel.password};
//
//     try {
//       final response = await Dio().post(
//         ConstantApi.login,
//         data: body,
//       );
//       Map<String, dynamic> jsonData = response.data;
//
//       LoginModel authModelResponse = LoginModel.fromJson(jsonData);
//
//       Methods.instance.saveUserToken(authToken: authModelResponse.token);
//       return authModelResponse;
//     } on DioException catch (e) {
//       throw DioHelper.handleDioError(
//           dioError: e, endpointName: "loginWithEmailAndPassword");
//     }
//   }
//
//   @override
//   Future<AuthWithGoogleModel> sigInWithGoogle() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
//
//     Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
//
//     final userModel = await login();
//
//     if (userModel == null) {
//       throw SignInGoogleException();
//     } else {
//       final body = {
//         "email": userModel.email,
//         "googleID": userModel.id,
//       };
//       try {
//         final response = await Dio().post(
//           ConstantApi.googleRegister,
//           data: body,
//         );
//
//         Map<String, dynamic> resultData = response.data;
//
//         MyDataModel userData = MyDataModel.fromMap(resultData);
//
//         Methods.instance.saveUserToken(authToken: resultData['token']);
//
//         return AuthWithGoogleModel(apiUserData: userData, userData: userModel);
//       } on DioException catch (e) {
//         throw DioHelper.handleDioError(
//             dioError: e, endpointName: "sigInWithGoogle");
//       }
//     }
//   }
//
//   @override
//   Future<LoginModel> signupWithEmailAndPassword(
//       SignupAuthModel signupAuthModel) async {
//     final body = {
//       "email": signupAuthModel.email,
//       "password": signupAuthModel.password
//     };
//
//     try {
//       final response = await Dio().post(
//         ConstantApi.signup,
//         data: body,
//       );
//       Map<String, dynamic> jsonData = response.data;
//
//       LoginModel authModelResponse = LoginModel.fromJson(jsonData);
//
//       Methods.instance.saveUserToken(authToken: authModelResponse.token);
//       return authModelResponse;
//     } on DioException catch (e) {
//       throw DioHelper.handleDioError(
//           dioError: e, endpointName: "SignupWithEmailAndPassword");
//     }
//   }
//
//   @override
//   Future<CountriesList> getCountries() async {
//
//     try {
//       final response = await Dio().get(
//         ConstantApi.countries,
//       );
//
//       CountriesList authModelResponse = CountriesList.fromJson(response.data);
//       return authModelResponse;
//     } on DioException catch (e) {
//       throw DioHelper.handleDioError(dioError: e, endpointName: "get Countries");
//     }
//   }
//
//
//
//   @override
//   Future<CitiesList> getCities(CitiesAuthModel citiesAuthModel) async {
//
//     try {
//       final response = await Dio().get(
//         ConstantApi.cities(citiesAuthModel.id),
//       );
//
//       CitiesList authModelResponse = CitiesList.fromJson(response.data);
//       return authModelResponse;
//     } on DioException catch (e) {
//       throw DioHelper.handleDioError(dioError: e, endpointName: "get Cities");
//     }
//   }
// }
