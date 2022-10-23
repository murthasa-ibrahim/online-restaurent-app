import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';

import '../../../widget/cart_items.dart';
import '../../../widget/place_order_btn.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kTextLightColor),
          automaticallyImplyLeading: true,
          backgroundColor: kWhite,
          elevation: 1,
          title: const Text(
            "Order Summary",
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: Consumer<CartProvider>(
                builder: (_, cartProvider, __) => Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: w,
                        height: 50,
                        child: Center(
                          child: Text(
                            '${cartProvider.cartList.length} Dishes - ${cartProvider.totalItemCount} items',
                            style: const TextStyle(
                                color: kWhite,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                     CartItems(provider: cartProvider,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "INR  ${context.read<CartProvider>().totalPrize}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: const PlaceOrderBtn(),
      ),
    );
  }
}
