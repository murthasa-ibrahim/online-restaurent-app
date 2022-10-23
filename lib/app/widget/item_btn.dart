
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/constant.dart';
import '../screens/cart/controller/cart_provider.dart';
import '../screens/home/model/category_model.dart';

class ItemAddBtn extends StatelessWidget {
  const ItemAddBtn({
    Key? key,
    required this.categoryDish,
  }) : super(key: key);
  final CategoryDish categoryDish;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .4,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(30)),
      child: Consumer<CartProvider>(
        builder: (_, provider, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  provider.removeItem(categoryDish);
                },
                icon: const Icon(Icons.remove, color: kWhite)),
            Text(
              categoryDish.count.toString(),
              style: const TextStyle(color: kWhite, fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                provider.addItem(categoryDish);
              },
              icon: const Icon(Icons.add, color: kWhite),
            )
          ],
        ),
      ),
    );
  }
}
