import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import '../../../../core/error/failures_strings.dart';
import '../../../../core/utils/api_helper.dart';
import '../../../../core/utils/constant_api.dart';
import '../../../../core/utils/methods.dart';

abstract class BaseRemotelyDataSource {
  Future<LoginModel> RegisterWithEmailAndPassword(LoginModel loginModel);

  Future<Unit> loginWithEmailAndPassword(LoginModel authModel);

// Future<AuthWithGoogleModel> sigInWithGoogle();

// Future<LoginModel> signupWithEmailAndPassword(SignupAuthModel signupAuthModel);

// Future<CitiesList> getCities(CitiesAuthModel citiesAuthModel);
// Future<CountriesList> getCountries();
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<LoginModel> RegisterWithEmailAndPassword(LoginModel loginModel) async {
    final body = {
      "country_id": loginModel.countryId,
      "first_name": loginModel.firstName,
      "middle_name": loginModel.middleName,
      "last_name": loginModel.lastName,
      "birthdate": loginModel.birthdate,
      "education": loginModel.education,
      "email": loginModel.email,
      "password": loginModel.password,
      "mobile": loginModel.mobile,
    };

    try {
      final response = await Dio().post(
        ConstantApi.register,
        data: body,
        // options: Options(contentType: Headers.jsonContentType),
      );
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] != 200) {
        print(jsonData);
        throw new Exception(jsonData['error']);
      }

      LoginModel authModelResponse = LoginModel.fromJson(jsonData);

      Methods.instance.saveUserToken(authToken: authModelResponse.token);
      return authModelResponse;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "SignupWithEmailAndPassword");
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
