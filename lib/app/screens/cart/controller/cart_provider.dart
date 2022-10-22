import 'package:flutter/cupertino.dart';

import '../../home/model/category_model.dart';

class CartProvider extends ChangeNotifier{


  List<CategoryDish> cartList = [];

  addItem(CategoryDish item) {
  final data = cartList.where((e) => e.dishId == item.dishId);
      if(data.isEmpty){
         cartList.add(item);
      }
      item.count;
    
   }
  
  
    notifyListeners();
  

  removeItem(CategoryDish item) {
    cartList.removeWhere((e) => e.dishId == item.dishId);
   
    notifyListeners();
  }
}