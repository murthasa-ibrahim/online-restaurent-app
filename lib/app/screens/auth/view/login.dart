import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/screens/auth/controller/sign_in_provider.dart';
import 'package:task_zartek/app/screens/auth/view/enter_number_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/firebase.png"),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  context.read<SignInProvider>().validatioin(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("assets/images/google (1).png"),
                    ),
                    title: Consumer<SignInProvider>(
                      builder: (context, value, child) => Center(
                        child: context.read<SignInProvider>().isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                ),
                              )
                            : const Text(
                                "Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                    trailing: const SizedBox(
                      width: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const NumberEnterScreen(),)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child: const ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Center(
                      child: Text(
                        "Phone",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: SizedBox(
                      width: 50,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
