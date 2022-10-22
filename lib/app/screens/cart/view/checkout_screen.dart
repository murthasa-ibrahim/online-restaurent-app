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
              child: Column(
                children: [
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: w,
                    height: 50,
                    child: const Center(
                      child: Text(
                        '2 Dishes - 2 items',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context.read<CartProvider>().cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Consumer<CartProvider>(builder: (_, hprovider, __) {
                          final item = hprovider.cartList[index];
                          return Column(
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
                                          size: 20,
                                          color: index % 2 == 0
                                              ? Colors.green
                                              : Colors.red),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(hprovider
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
                                      children: const [Text("INR 22.00")],
                                    )
                                  ],
                                ),
                              ),
                              const Divider()
                            ],
                          );
                        }),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "INR  35",
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
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
                  ))),
        ),
      ),
    );
  }
}
