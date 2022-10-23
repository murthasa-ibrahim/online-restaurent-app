
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_zartek/app/screens/home/view/user_home.dart';

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
      final double = item.dishPrice * 21.96;
      final inrValue = double.toInt();
   log(inrValue.toString());
      count += item.count;
      price += item.count * inrValue;
    }
    totalItemCount = count;
    totalPrize = price;
    notifyListeners();
  }

  void placeOrder({
    required BuildContext context,
  }) {
    cartList.clear();
    totalPrize = 0;
    totalItemCount = 0;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Image.asset(
              'assets/images/greentick.png',
              height: 80,
              width: 80,
            ),
            content: Text(
              "Order Placed Successfully",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        }).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      ),
    );
  }


   String converToINR(double value) {
    final double = value * 21.96;
    final str = double.toInt().toString();
    return str;
  }
}
