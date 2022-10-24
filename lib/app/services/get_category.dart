import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';

class ApiService {
  Future<List<CategoryModel>> getCategoryApi() async {
    const uri = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
    log("api called......");
    try {
      final response = await Dio().get(uri);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return categoryModelFromJson(
            jsonEncode(response.data[0]["table_menu_list"]));
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          if (e.response?.data == null) {
            throw "something went wrong";
          }
        }
        throw "No network";
      }
    }
    throw 'something went wrong';
  }
}
