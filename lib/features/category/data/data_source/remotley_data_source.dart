import 'dart:convert';
import 'dart:math';
import 'package:Learn_U/core/utils/api_helper.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/category/data/model/course_details_model.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/constant_api.dart';

abstract class BaseCategoriesRemotelyDataSource {
  Future<List<CategoriesModel>> getCategories();
  Future<List<TrainersModel>> gettrainers();
  Future<CourseDetailsModel> getcoursedetails(int course_id);
  Future<List<ReviewsModel>> getReviews(int course_id);
  Future<Unit> SendReview(
      int course_id, double review_value, String review_message);
}

class CategoryRemotelyDateSource extends BaseCategoriesRemotelyDataSource {
  @override
  Future<List<CategoriesModel>> unsavedcategories() async {
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
        save_categories(categories);
        return categories;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  Future<void> save_categories(List<CategoriesModel> trainers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(trainers.map((e) => e.toJson()).toList());
    await prefs.setString('categories_info', data);
  }

  Future<List<CategoriesModel>> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('categories_info');
    if (data != null) {
      Iterable<dynamic> decodeddata = json.decode(data);
      return decodeddata.map((e) => CategoriesModel.fromJson(e)).toList();
    } else {
      return await unsavedcategories();
    }
  }

  @override
  Future<List<TrainersModel>> unsavedtrainers() async {
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
        save_trainers(trainers);
        return trainers;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  Future<void> save_trainers(List<TrainersModel> trainers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(trainers.map((e) => e.toJson()).toList());
    await prefs.setString('trainers_info', data);
  }

  Future<List<TrainersModel>> gettrainers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('trainers_info');
    if (data != null) {
      Iterable<dynamic> decodeddata = json.decode(data);
      return decodeddata.map((e) => TrainersModel.fromJson(e)).toList();
    } else {
      return await unsavedtrainers();
    }
  }

  @override
  Future<CourseDetailsModel> unsavedcoursedetails(int course_id) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response =
          await dio.get(ConstantApi.coursedetails + course_id.toString());

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final Map<String, dynamic> details = jsonResponse['data'];
        print("==============================");
        print(details);
        save_course_details(CourseDetailsModel.fromJson(details), course_id);
        return CourseDetailsModel.fromJson(details);
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  Future<void> save_course_details(
      CourseDetailsModel courseDetails, int course_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(courseDetails.toJson());
    await prefs.setString('course_details_$course_id', data);
  }

  Future<CourseDetailsModel> getcoursedetails(int course_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('course_details_$course_id');

    if (data != null) {
      final Map<String, dynamic> jsonData = json.decode(data);
      return CourseDetailsModel.fromJson(jsonData);
    } else {
      return await unsavedcoursedetails(course_id);
    }
  }

  @override
  Future<Unit> SendReview(
      int course_id, double review_value, String review_message) async {
    final body = {
      "course_id": course_id,
      "review": review_value,
      "message": review_message,
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'cid': prefs.getString("user_cid")
          },
        ),
        ConstantApi.sendreview,
        data: FormData.fromMap(body),
      );
      print(body['course_id']);
      print(body['review']);
      print(body['message']);
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
  Future<List<ReviewsModel>> getReviews(int course_id) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response =
          await dio.get(ConstantApi.getreview + course_id.toString());

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> reviewsJson = jsonResponse['data'];
        List<ReviewsModel> reviews = reviewsJson.map((json) {
          return ReviewsModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        return reviews;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
