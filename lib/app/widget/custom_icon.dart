import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.size, required this.color})
      : super(key: key);
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(border: Border.all(color: color)),
      child: Center(
        child: Icon(
          Icons.circle,
          color: color,
          size: size * .6,
        ),
      ),
    );
  }
}