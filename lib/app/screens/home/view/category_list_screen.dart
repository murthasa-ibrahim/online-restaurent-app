import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';
import 'package:task_zartek/app/screens/home/controller/home_controller.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';
import 'package:task_zartek/app/widget/Item_btn.dart';
import 'package:task_zartek/app/widget/custom_icon.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key, required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final item = categoryModel.categoryDishes;
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: item.length,
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
            );
          },
          itemBuilder: (context, index) => Container(
            color: kWhite,
            margin: const EdgeInsets.all(13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kdefaultPadding / 4),
                            child: CustomIcon(
                              categoryDish: item[index],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item[index].dishName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kdefaultPadding / 2),
                            child: Text(
                              "INR ${context.read<CartProvider>().converToINR(item[index].dishPrice)}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: kdefaultPadding / 4),
                            child: Text(
                                '${item[index].dishCalories.round()} calories',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kdefaultPadding / 2),
                        child: Text(item[index].dishDescription),
                      ),
                      ItemAddBtn(
                        categoryDish: item[index],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      item[index].addonCat!.isNotEmpty
                          ? const Text(
                              "Customization Available",
                              style: TextStyle(color: Colors.red),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/soup.jpg',
                  height: 70,
                  width: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
