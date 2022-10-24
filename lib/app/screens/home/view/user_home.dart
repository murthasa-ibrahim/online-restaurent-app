import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';
import 'package:task_zartek/app/screens/cart/view/cart_screen.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';
import 'package:task_zartek/app/screens/home/view/category_list_screen.dart';
import 'package:task_zartek/app/services/get_category.dart';
import 'package:task_zartek/app/widget/darwer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.green),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_rounded,
              color: kblack,
              size: 30,
            ),
          ),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cartProvider, __) => Badge(
              position: BadgePosition.topEnd(top: 10, end: 4),
              badgeContent: Text(
                "${cartProvider.cartList.length}",
                style:
                    const TextStyle(color: kWhite, fontWeight: FontWeight.bold),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.local_grocery_store,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: kWhite,
      ),
      drawer: Drawer(child: MyDarawer(size: size)),
      body: SafeArea(
        child: FutureBuilder<List<CategoryModel>>(
          future: ApiService().getCategoryApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<CategoryModel> items = snapshot.data!;
              return DefaultTabController(
                length: items.length,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.pink,
                      isScrollable: true,
                      labelColor: Colors.pink,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      unselectedLabelColor: kTextLightColor,
                      tabs: items
                          .map(
                            (e) => Tab(text: e.menuCategory),
                          )
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                          children: items
                              .map(
                                (e) => CategoryListScreen(categoryModel: e),
                              )
                              .toList()),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
