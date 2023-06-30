// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../fonts/fonts.dart';
import '../widgets/button_container_widget.dart';
import '../widgets/responsive.dart';
import 'admin/admin_login.dart';
import 'class_teacher/class_teacher_screen_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key}) : super(key: key);
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MainSuperAdminController mainsuperAdminController =
      Get.put(MainSuperAdminController());
  @override
  Widget build(BuildContext context) {
    mainsuperAdminController.checkinActivation(context);
    var screenSize = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                        height: height,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: screenSize.width * 1 / 7),
                              child: Container(
                                // height: height,
                                height: screenSize.width * 1 / 5,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/leptdujo1.png"))),
                              ),
                            )
                          ],
                        )),
                  ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return TeacherLoginScreen();
                  //       },
                  //     ));
                  //   },
                  //   child: ButtonContainerWidget(
                  //       curving: 30,
                  //       // ignore: sort_child_properties_last
                  //       child: Center(
                  //         child: Text(
                  //           "Teacher Login",
                  //           style: GoogleFont.subHeadTextStyle,
                  //         ),
                  //       ),
                  //       colorindex: 0,
                  //       height: screenSize.width/8,
                  //       width: 400),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ClassTeacherLoginScreen(
                            schoolID: '',
                          );
                        },
                      ));
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text("Class Teacher Login",
                              style: GoogleFont.subHeadTextStyle),
                        ),
                        colorindex: 1,
                        height: screenSize.width / 8,
                        width: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminLoginScreen();
                        },
                      ));
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text("Admin Login",
                              style: GoogleFont.subHeadTextStyle),
                        ),
                        colorindex: 7,
                        height: screenSize.width / 8,
                        width: 400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
