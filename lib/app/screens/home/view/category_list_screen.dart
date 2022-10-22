import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';
import 'package:task_zartek/app/screens/home/controller/home_controller.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';
import 'package:task_zartek/app/widget/custom_icon.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key, required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final item = categoryModel.categoryDishes;
    log(categoryModel.categoryDishes[0].dishImage);
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
            color: Colors.white,
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
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kdefaultPadding / 4),
                            child: CustomIcon(size: 20, color: Colors.green),
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
                              "${item[index].dishCurrency} ${item[index].dishPrice}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Spacer(),
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
                       ItemAddBtn(categoryDish: item[index],)
                    ],
                  ),
                ),
                // Image.network(
                //   item[index].dishImage,
                //   height: 20,
                //   width: 20,

                // )
                FadeInImage(
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                          width: 70,
                          height: 70,
                          color: Colors.grey,
                        ),
                    width: 70,
                    height: 70,
                    placeholder:
                        const AssetImage("assets/images/soup.jpg"),
                    image: NetworkImage(
                      item[index].dishImage,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemAddBtn extends StatelessWidget {
  const ItemAddBtn({
    Key? key, required this.categoryDish,
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
        builder: (_, provider, __) => 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  provider.removeItem(categoryDish);
                }, icon: const Icon(Icons.remove, color: kWhite)),
             Text(
              categoryDish.count.toString(),
              style:const TextStyle(color: kWhite, fontSize: 20),
            ),
            IconButton(
                onPressed: () {
                  provider.addItem(categoryDish);
                }, icon: const Icon(Icons.add, color: kWhite))
          ],
        ),
      ),
    );
  }
}
