import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';
import 'package:task_zartek/app/services/get_category.dart';

class HomeProvider extends ChangeNotifier {
  
  void getCategory() async {
    final response = await ApiService().getCategoryApi();
    log('ssssssss');
    // log(response[0].toString());
  }

  
}
