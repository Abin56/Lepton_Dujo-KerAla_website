import 'package:dujo_kerala_website/view/web/home/create_school/create_school.dart';
import 'package:dujo_kerala_website/view/web/home/privacypolicy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/web/dujo_homePage/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBPaQ4Ga-d_wTd9pCiU_kMTllMeuVblSP0",
        authDomain: "leptondujokerala.firebaseapp.com",
        projectId: "leptondujokerala",
        storageBucket: "leptondujokerala.appspot.com",
        messagingSenderId: "512252187081",
        appId: "1:512252187081:web:29a9843fc66f17bc6f5818",
        measurementId: "G-QC6SR6TLE0"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        routes: {
          PrivacyPolicy.route: (context) => const PrivacyPolicy(),
          SchoolProfile.route: (context) => const SchoolProfile(),
        },
        title: 'COSTECH DuJo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF02BB9F),
          primaryColorDark: const Color(0xFF167F67),
        ),
        home: const MainScreen());
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
