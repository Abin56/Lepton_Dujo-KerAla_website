import 'package:flutter/material.dart';

import '../../colors/colors.dart';

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
       backgroundColor: adminePrimayColor,
      appBar: AppBar(iconTheme: IconThemeData(color: cWhite),
      backgroundColor: adminePrimayColor),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize.width * 1 / 4,
            child: Column(
              children: [
                Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2FImages%2Fpolicy%2Fchild%20policy_1.jpg?alt=media&token=09a998f0-412b-474e-a7f6-82affda0f92f'),
                Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2FImages%2Fpolicy%2Fchild%20policy_2.jpg?alt=media&token=dd2b4a24-86c4-40c6-aa0a-374938492901'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
