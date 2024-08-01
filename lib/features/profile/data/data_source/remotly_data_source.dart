import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constant_api.dart';

abstract class BaseProfileRemotelyDataSource {
  Future<List<UserModel>> getuserdata();
}

class ProfileRemotelyDateSource extends BaseProfileRemotelyDataSource {
  @override
  Future<List<UserModel>> getuserdata() async {
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

        return users;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
