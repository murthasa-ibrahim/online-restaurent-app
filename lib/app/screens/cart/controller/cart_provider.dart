import 'package:flutter/material.dart';
import 'package:task_zartek/app/utils/utils.dart';

import '../../home/model/category_model.dart';

class CartProvider extends ChangeNotifier {
  List<CategoryDish> cartList = [];
  double totalPrize = 0;
  int totalItemCount = 0;
  addItem(CategoryDish item) {
    if (!cartList.contains(item)) {
      cartList.add(item);
    }
    item.count++;
    totalItemCount++;
    totalPrize += item.dishPrice;
    notifyListeners();
  }

  removeItem(CategoryDish item) {
    if (item.count > 0) {
      if (item.count == 1) {
        cartList.remove(item);
      }
      item.count--;
      totalPrize -= item.dishPrice;
      totalItemCount--;
      notifyListeners();
    }
  }

  void placeOrder({
    required BuildContext context,
  }) {
    for (var item in cartList) {
      item.count = 0;
    }
    notifyListeners();
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
      (value) => Navigator.of(context).pop(),
    );
  }
}
