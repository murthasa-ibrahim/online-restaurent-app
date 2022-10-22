import 'package:flutter/material.dart';
import 'package:task_zartek/app/screens/home/model/category_model.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.categoryDish}) : super(key: key);

  final CategoryDish categoryDish;
  @override
  Widget build(BuildContext context) {
    final color = categoryDish.dishType == 1
        ? const Color.fromARGB(255, 133, 22, 12)
        : Colors.green;
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(border: Border.all(color: color)),
      child: Center(
        child: Icon(
          Icons.circle,
          color: color,
          size: 20 * .6,
        ),
      ),
    );
  }
}
