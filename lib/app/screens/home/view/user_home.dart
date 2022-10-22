import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/auth/controller/sign_in_provider.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';
import 'package:task_zartek/app/screens/cart/view/checkout_screen.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';
import 'package:task_zartek/app/screens/home/view/category_list_screen.dart';
import 'package:task_zartek/app/services/get_category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = context.read<SignInProvider>();
    return Scaffold(
      appBar: AppBar(
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
              )),
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
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            height: size.height * .3,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: DrawerHeader(
                child: Consumer<SignInProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: FadeInImage(
                        imageErrorBuilder: (context, error, stackTrace) => Image.asset("assets/images/firebase.png",fit: BoxFit.cover,height: 80,width: 80,),
                        fit: BoxFit.cover,
                        placeholder: const AssetImage("assets/images/firebase.png",),
                        image: NetworkImage(
                          loginProvider.user?.photoURL??'',
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kdefaultPadding / 2),
                    child: Text(
                      loginProvider.user?.displayName ?? 'user name',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "ID : ${loginProvider.user?.uid}",
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
          ListTile(
            onTap: () => loginProvider.googleSingOut(context),
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 22, color: kTextLightColor),
            ),
          )
        ],
      )),
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
  /* Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.local_grocery_store_outlined)),
            ],
          ),
        
        ],
      )*/
}
