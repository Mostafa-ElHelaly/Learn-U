import 'dart:convert';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/constant_api.dart';

abstract class BaseProfileRemotelyDataSource {
  Future<List<UserModel>> getuserdata();
}

class ProfileRemotelyDateSource extends BaseProfileRemotelyDataSource {
  @override
  Future<List<UserModel>> unsaved_user_data() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.users);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> usersJson = jsonResponse['data'];
        List<UserModel> users = usersJson.map((json) {
          return UserModel.fromJson(json);
        }).toList();
        save_user_data(users);
        return users;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  Future<void> save_user_data(List<UserModel> trainers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(trainers.map((e) => e.toJson()).toList());
    await prefs.setString('user_data', data);
  }

  Future<List<UserModel>> getuserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('user_data');
    if (data != null) {
      Iterable<dynamic> decodeddata = json.decode(data);
      return decodeddata.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return await unsaved_user_data();
    }
  }
}
