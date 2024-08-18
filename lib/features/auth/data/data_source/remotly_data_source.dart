import 'dart:convert';
import 'dart:math';

import 'package:Learn_U/features/auth/data/model/CountriesModel.dart';
import 'package:Learn_U/features/auth/data/model/countries_model.dart';
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
  Future<Map<String, dynamic>> otpemail(LoginModel resetPasswordModel);

// Future<AuthWithGoogleModel> sigInWithGoogle();

// Future<LoginModel> signupWithEmailAndPassword(SignupAuthModel signupAuthModel);

// Future<CitiesList> getCities(CitiesAuthModel citiesAuthModel);
  Future<List<CountriesModel>> getCountries();
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
      final response = await Dio().post(
        ConstantApi.register,
        data: FormData.fromMap(body),
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );
      Map<String, dynamic> jsonData = response.data;
      if (jsonData['status'] == 200) {
        return Future.value(unit); // Return response data
      } else {
        throw Exception('Login failed with status code ${jsonData['error']}');
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

      Map<String, dynamic> jsonData = response.data;
      if (jsonData['status'] == 200) {
        return Future.value(unit); // Return response data
      } else {
        throw Exception('Login failed with status code ${jsonData['error']}');
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

  @override
  Future<List<CountriesModel>> getCountries() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      Response response = await dio.get(ConstantApi.countries);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> countriesJson = jsonResponse['data']['countries'];

        // Convert JSON list to List<CountriesModel>
        List<CountriesModel> countries = countriesJson.map((json) {
          return CountriesModel.fromJson(json);
        }).toList();

        return countries;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> otpemail(LoginModel otpemailModel) async {
    final body = {
      "email": otpemailModel.email,
    };

    try {
      print("---------------");
      final response = await Dio().post(
        ConstantApi.otpemail,
        data: body,
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );
      Map<String, dynamic> jsonData = response.data;
      if (jsonData['status'] == 200) {
        return jsonData; // Return response data
      } else {
        throw Exception('Login failed with status code ${jsonData['error']}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "RegisterWithEmailAndPassword");
    }
  }
}
