import 'package:flutter/material.dart';

class FamilyPolicyScreen extends StatefulWidget {
  const FamilyPolicyScreen({super.key});

  @override
  State<FamilyPolicyScreen> createState() => _FamilyPolicyScreenState();
}

class _FamilyPolicyScreenState extends State<FamilyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize.width * 1 / 2,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/child policy_1.jpg",
                ),
                Image.asset(
                  "assets/images/child policy_2.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
