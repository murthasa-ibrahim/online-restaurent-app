import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/home/controller/home_controller.dart';

class TestIzn extends StatefulWidget {
  const TestIzn({Key? key}) : super(key: key);

  @override
  State<TestIzn> createState() => _TestIznState();
}


class _TestIznState extends State<TestIzn> {
   @override
  void initState() {
  // context.read<HomeProvider>().getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
        itemCount: 10,
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
                    const Text(
                      'Spnaish Salad',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(kdefaultPadding / 2),
                          child: Text(
                            'SAR 7.95',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: kdefaultPadding / 4),
                          child: Text('15 calories',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(kdefaultPadding / 2),
                      child: Text('aseet are'),
                    ),
                    const ItemAddBtn()
                  ],
                ),
              ),
              Image.asset(
                'assets/images/butterfly.jpg',
                height: 70,
                width: 70,
              )
            ],
          ),
        ),
      )),
    );
  }
}

class ItemAddBtn extends StatelessWidget {
  const ItemAddBtn({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .4,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove, color: kWhite)),
          const Text(
            '0',
            style: TextStyle(color: kWhite, fontSize: 20),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add, color: kWhite))
        ],
      ),
    );
  }
}
