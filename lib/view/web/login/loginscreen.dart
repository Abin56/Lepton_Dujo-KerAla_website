// ignore_for_file: file_names

import 'dart:developer';
import 'package:dujo_kerala_website/view/web/login/teacher/teacher_login_screen.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../fonts/fonts.dart';
import '../widgets/button_container_widget.dart';
import '../widgets/responsive.dart';
import 'admin/admin_login.dart';
import 'class_teacher/class_teacher_screen_login.dart';

class LoginScreen extends StatefulWidget {
  String schoolID;
  LoginScreen({required this.schoolID, Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    log(widget.schoolID);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                              padding:  EdgeInsets.only(top: screenSize.width*1/7),
                              child: Container(
                               // height: height,
                               height: screenSize.width*1/5,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const TeacherLoginScreen();
                        },
                      ));
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text(
                            "Teacher Login",
                            style: GoogleFont.subHeadTextStyle,
                          ),
                        ),
                        colorindex: 0,
                        height: 200,
                        width: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ClassTeacherLoginScreen(
                            schoolID: widget.schoolID,
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
                        height: 200,
                        width: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          log("Admin Login>>>>>>>>>>${widget.schoolID}");
                          return AdminLoginScreen(
                            adminSchoolId: schoolListValue!['id'],

                           
                          );
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
                        height: 200,
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
