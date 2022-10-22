import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/screens/auth/controller/otp_provider.dart';
import 'package:task_zartek/app/screens/auth/controller/sign_in_provider.dart';
import 'package:task_zartek/app/screens/auth/view/login.dart';
import 'package:task_zartek/app/screens/cart/controller/cart_provider.dart';
import 'package:task_zartek/app/screens/home/controller/home_controller.dart';
import 'package:task_zartek/app/screens/home/view/user_home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),),
        ChangeNotifierProvider<SignInProvider>(create: (context) => SignInProvider(),),
        ChangeNotifierProvider<OtpController>(create: (context) => OtpController(),),
        ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider(),)
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
             debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: Home(),
            home:  context.read<SignInProvider>().user == null ? const LoginScreen() : const Home()
          );
        }
      ),
    );
  }
}
