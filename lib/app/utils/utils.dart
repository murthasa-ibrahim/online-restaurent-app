import 'package:flutter/material.dart';

class Utils{
  
  static double inrValueOf(double sar){
    return sar*21.96;
  }

  static void showSnackbar({required BuildContext context,required String msg,Color color = Colors.red}){
      final snackBar =  SnackBar(content: Text(msg),backgroundColor: color,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}