import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constant_api.dart';

abstract class BaseCategoriesRemotelyDataSource {
  Future<List<Categories>> getCategories();
}

class CategoriesRemotelyDateSource extends BaseCategoriesRemotelyDataSource {
  @override
  Future<List<Categories>> getCategories() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.categories);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> usersJson = jsonResponse['data'];
        List<Categories> users = usersJson.map((json) {
          return Categories.fromJson(json);
        }).toList();

        return users;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
