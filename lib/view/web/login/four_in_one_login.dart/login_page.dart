
import 'package:dujo_kerala_website/view/style/glassmorphism.dart';
import 'package:dujo_kerala_website/view/web/login/four_in_one_login.dart/select_user.dart';
import 'package:flutter/material.dart';

import '../../widgets/textformfeildwidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Color istColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  'assets/images/loginscreen.jpg',
                ))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 0),
            child: Row(
              children: [
                GlassMorphism(
                  start: 0.6,
                  end: 0.1,
                  child: Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: istColor,
                                fontSize: 25),
                          ),
                        ),
                        Text(
                          "Please enter your details",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: istColor.withOpacity(0.3),
                              fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            height: 70,
                            child: TextFormFiledContainerWidget(
                                hintText: 'Enter your email',
                                title: "Email",
                                width: 300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: 64,
                            child: TextFormFiledContainerWidget(
                                hintText: 'Enter your password',
                                title: "Password",
                                width: 300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 180, bottom: 10),
                          child: Text(
                            "Forgot your password ?",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                              color: istColor.withOpacity(0.3),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              functionc(
                                context,
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
