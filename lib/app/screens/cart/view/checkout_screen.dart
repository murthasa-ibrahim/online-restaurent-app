import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';

import '../../../widget/custom_icon.dart';
import '../../home/view/category_list_screen.dart';

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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartProvider.cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = cartProvider.cartList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                // color: Colors.red,
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
                                          Text(cartProvider
                                              .cartList[index].dishName),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${item.dishCurrency} ${item.dishPrice}",
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
                                          "INR ${item.dishPrice}",
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
                    ),
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
        bottomNavigationBar: Padding(
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
                  ))),
              onPressed: () {},
              child: const Text(
                "Place Order",
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
