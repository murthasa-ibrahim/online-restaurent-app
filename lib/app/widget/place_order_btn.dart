
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart/controller/cart_provider.dart';

class PlaceOrderBtn extends StatelessWidget {
  const PlaceOrderBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 16, 40, 17)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),),),
          onPressed: () {
            context.read<CartProvider>().placeOrder(context: context,);
          },
          child: const Text(
            "Place Order",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
