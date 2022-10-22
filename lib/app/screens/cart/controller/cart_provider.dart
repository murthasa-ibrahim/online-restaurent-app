import 'package:flutter/cupertino.dart';

import '../../home/model/category_model.dart';

class CartProvider extends ChangeNotifier {
  List<CategoryDish> cartList = [];
  double totalPrize = 0;
  int totalItemCount = 0;
  addItem(CategoryDish item) {
    final data = cartList.where((e) => e.dishId == item.dishId);
    if (data.isEmpty) {
      cartList.add(item);
    }
    item.count++;
    notifyListeners();
    calculate();
  }

  removeItem(CategoryDish item) {
    if (item.count > 0) {
      if (item.count == 1) {
        cartList.removeWhere((e) => e.dishId == item.dishId);
      }
      item.count--;

      notifyListeners();
    }

    calculate();
  }

  void calculate() {
    int count = 0;
    double price = 0;
    for (var item in cartList) {
      count += item.count;
      price += item.count * item.dishPrice;
    }
    totalItemCount = count;
    totalPrize = price;
    notifyListeners();
  }
}
