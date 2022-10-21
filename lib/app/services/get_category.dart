import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';

class GetCategory {
  getCategoryApi() async {
    const uri = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

    try {
      final response = await Dio().get(uri);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('success');

        final a = response.data[0]["table_menu_list"];
        log(a.toString());
        log('murrrrr');
        final b = categoryModelFromJson(
            jsonEncode(response.data[0]["table_menu_list"]));
        log(b.toString());
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          if (e.response?.data == null) {
            return "something went wrong";
          }
        }
        return "No network";
      }
    }
  }
}
