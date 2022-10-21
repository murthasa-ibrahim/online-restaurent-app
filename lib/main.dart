import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/screens/auth/view/login.dart';
import 'package:task_zartek/app/screens/home/controller/home_controller.dart';
import 'package:task_zartek/app/screens/home/view/test_izn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
