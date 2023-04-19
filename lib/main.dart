import 'package:dujo_kerala_website/ui%20team/abin/alumini_accocation/alumni_assocation.dart';
import 'package:dujo_kerala_website/ui%20team/abin/food_and_beverages/sample.dart';
import 'package:dujo_kerala_website/view/web/home/dujo_home.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/admin_dashborad_screen.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/all_Students/all_students_view_Screen.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/bus_Route/bus_route.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/bus_Route/create_bus_route.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/non_Teaching_staff/non_teaching_staff.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/teachers_panel_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCvnr3tZft-N4oPk0g_StLM5-HaZYY2ws8",
        authDomain: "dujo-kerala-schools-1a6c5.firebaseapp.com",
        projectId: "dujo-kerala-schools-1a6c5",
        storageBucket: "dujo-kerala-schools-1a6c5.appspot.com",
        messagingSenderId: "1019389632971",
        appId: "1:1019389632971:web:73f653f467a7d5dc06164e",
        measurementId: "G-NBQ0J2X8HQ"),
  );
  ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(1536, 792),
        builder: (context, child) {
          return GetMaterialApp(
              title: 'DuJo Web',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: const Color(0xFF02BB9F),
                primaryColorDark: const Color(0xFF167F67),
                // ignore: deprecated_member_use
                accentColor: const Color(0xFF02BB9F),
              ),
              home: 
             // AlumniAssocation()
             //ClassTeacherAdmin(schoolID: '',teacherEmail:'' ,teacherID: '',)
            // AllStudentList()
           // AdminDashBoardPage(schoolID: '',date: '',loginTime: '',wadmin: '',key: null,)
          // AllStdf()
        // BusRoute()
        // NonTeachingLogin(schoolID: '',)
             DujoHomePage()
              );
        });
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
