
import 'package:flutter/material.dart';
import 'package:task_zartek/app/utils/utils.dart';

import '../screens/cart/controller/cart_provider.dart';
import 'Item_btn.dart';
import 'custom_icon.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key, required this.provider,
  }) : super(key: key);
 final CartProvider provider;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.cartList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = provider.cartList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 130,
              
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CustomIcon(
                        categoryDish: item,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(item.dishName),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "INR ${Utils.inrValueOf(item.dishPrice).toStringAsFixed(2)}",
                            style:
                                const TextStyle(fontSize: 10),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "220 calories",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ItemAddBtn(categoryDish: item)
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "INR ${Utils.inrValueOf(item.dishPrice).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        );
      },
    );
  }
}
