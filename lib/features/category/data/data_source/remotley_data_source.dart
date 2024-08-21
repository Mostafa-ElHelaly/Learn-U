import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constant_api.dart';

abstract class BaseCategoriesRemotelyDataSource {
  Future<List<CategoriesModel>> getCategories();
  Future<List<TrainersModel>> gettrainers();
}

class CategoryRemotelyDateSource extends BaseCategoriesRemotelyDataSource {
  @override
  Future<List<CategoriesModel>> getCategories() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.categories);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> categoriesJson = jsonResponse['data'];
        List<CategoriesModel> categories = categoriesJson.map((json) {
          return CategoriesModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        return categories;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  @override
  Future<List<TrainersModel>> gettrainers() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.trainers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> trainersJson = jsonResponse['data'];
        List<TrainersModel> trainers = trainersJson.map((json) {
          return TrainersModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        return trainers;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
