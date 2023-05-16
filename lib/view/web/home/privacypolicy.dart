import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});
  static const String route = '/privacypolicy';

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: adminePrimayColor,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: cWhite),
          backgroundColor: adminePrimayColor),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize.width * 1 / 2,
            child: Column(
              children: [
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%201.jpg?alt=media&token=557841f6-357b-467b-83e3-a89c2d5a631b",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%202.jpg?alt=media&token=c0169af7-77fe-44b5-97df-c0a65b97b476",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%203.jpg?alt=media&token=49baf70d-346d-42ef-aa58-8ebbe665ca09",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%204.jpg?alt=media&token=1deb3826-4397-4ffa-93ce-b887d44104f4",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%205.jpg?alt=media&token=b3913f7e-9d62-44c8-b0e5-4ebe3edc9cb3",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%206.jpg?alt=media&token=1c5c2e8b-d77c-4753-9e4b-557a0d67573a",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fprivacy%207.jpg?alt=media&token=c08fa12d-ffa4-4f27-9f2d-46f3c2f060d1",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fchild%20policy%201.jpg?alt=media&token=5d3a5ddb-6006-4817-9b8e-0af697f00cb2",
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/dujo-kerala-schools-1a6c5.appspot.com/o/files%2Fprivacy%20and%20policy%2Fchild%20policy%202.jpg?alt=media&token=76204174-3c2a-4c17-b8d3-144f03aab3df",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
