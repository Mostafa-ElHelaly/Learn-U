import 'package:Learn_U/features/auth/data/model/login_model.dart';

import 'package:dio/dio.dart';

import '../../../../core/utils/api_helper.dart';
import '../../../../core/utils/constant_api.dart';
import '../../../../core/utils/methods.dart';

abstract class BaseRemotelyDataSource {
  Future<RegisterModel> RegisterWithEmailAndPassword(
      RegisterModel registerModel);

  // Future<AuthWithGoogleModel> sigInWithGoogle();

  // Future<LoginModel> signupWithEmailAndPassword(SignupAuthModel signupAuthModel);

  // Future<CitiesList> getCities(CitiesAuthModel citiesAuthModel);
  // Future<CountriesList> getCountries();
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<RegisterModel> RegisterWithEmailAndPassword(
      RegisterModel registerModel) async {
    final body = {
      "country_id": registerModel.country_id,
      "first_name": registerModel.first_name,
      "middle_name": registerModel.middle_name,
      "last_name": registerModel.last_name,
      "birthdate": registerModel.birthdate,
      "education": registerModel.education,
      "email": registerModel.email,
      "password": registerModel.password,
      "mobile": registerModel.mobile,
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

      RegisterModel authModelResponse = RegisterModel.fromJson(jsonData);

      Methods.instance.saveUserToken(authToken: authModelResponse.token);
      return authModelResponse;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "SignupWithEmailAndPassword");
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
