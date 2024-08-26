import 'dart:convert';

import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/auth/data/model/countries_model.dart';
import 'package:dio/dio.dart';

import 'package:Learn_U/core/utils/constant_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseSearchRemotelyDataSource {
  Future<List<SearchModel>> getSearch();
}

class SearchRemotelyDateSource extends BaseSearchRemotelyDataSource {
  @override
  Future<List<SearchModel>> unsavedsearch() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      Response response = await dio.get(ConstantApi.search);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> searchJson = jsonResponse['data'];

        // Convert JSON list to List<CountriesModel>
        List<SearchModel> search = searchJson.map((json) {
          return SearchModel.fromJson(json);
        }).toList();
        print(response.data['data']);
        save_trainers(search);
        return search;
      } else {
        throw Exception('Getting search Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching search: $e');
    }
  }

  Future<void> save_trainers(List<SearchModel> trainers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(trainers.map((e) => e.toJson()).toList());
    await prefs.setString('courses_info', data);
  }

  Future<List<SearchModel>> getSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('courses_info');
    if (data != null) {
      Iterable<dynamic> decodeddata = json.decode(data);
      return decodeddata.map((e) => SearchModel.fromJson(e)).toList();
    } else {
      return await unsavedsearch();
    }
  }
}
