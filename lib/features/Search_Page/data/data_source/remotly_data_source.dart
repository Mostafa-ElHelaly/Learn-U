import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/auth/data/model/countries_model.dart';
import 'package:dio/dio.dart';

import 'package:Learn_U/core/utils/constant_api.dart';

abstract class BaseSearchRemotelyDataSource {
  // Future<Unit> loginWithEmailAndPassword(LoginModel authModel);
  // Future<Unit> forgetpassword(LoginModel resetPasswordModel);
  // Future<Map<String, dynamic>> otpemail(LoginModel resetPasswordModel);
  // Future<AuthWithGoogleModel> sigInWithGoogle();
  // Future<LoginModel> signupWithEmailAndPassword(SignupAuthModel signupAuthModel);
  // Future<CitiesList> getCities(CitiesAuthModel citiesAuthModel);
  Future<List<SearchModel>> getSearch();
}

class SearchRemotelyDateSource extends BaseSearchRemotelyDataSource {
  @override
  Future<List<SearchModel>> getSearch() async {
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
        return search;
      } else {
        throw Exception('Getting search Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching search: $e');
    }
  }
}
