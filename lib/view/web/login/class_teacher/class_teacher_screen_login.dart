import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/widgets/responsive.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../colors/colors.dart';
import '../../../constant/constant.dart';
import '../../../fonts/fonts.dart';
import '../../../icons/icons.dart';
import 'classteacher_dash_board/teachers_panel_screen.dart';

class ClassTeacherLoginScreen extends StatelessWidget {
  String schoolID;
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ClassTeacherLoginScreen({required this.schoolID, Key? key}) : super(key: key);

  final TextEditingController _facultyController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log(schoolID);
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
                      color: const Color(0xFF26A69A),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Class Teacher',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          sizedBoxH30,
                          SizedBox(
                            height: 300.h,
                            child: LottieBuilder.network(
                                'https://assets4.lottiefiles.com/private_files/lf30_edmvwyn8.json'),
                          )
                        ],
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Let’s',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Teacher ID',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: idController,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.emailIcon),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter ID',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueDarkColor,
                            fontSize: 12.0,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.eyeIcon),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppIcons.lockIcon),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter Password',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: const Color(0xFF26A69A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            //>>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                            CollectionReference cat = FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(schoolID)
                                .collection("Teachers");
                            Query query = cat.where("teacherEmail",
                                isEqualTo: idController.text.trim());
                            QuerySnapshot querySnapshot = await query.get();
                            final docData = querySnapshot.docs
                                .map((doc) => doc.data())
                                .toList();

                            // log('asfdddddd${querySnapshot.docs.map((doc) => doc.data()).toString().toString()}');

                            // log(query.toString());
                            // log(cat.get().toString());
                            // log(docData.toString());
                            // //
                            //>>>>>>>>>>>>>>>>>>>Checking password<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                            CollectionReference pass = FirebaseFirestore
                                .instance
                                .collection("SchoolListCollection")
                                .doc(schoolID)
                                .collection("Teachers");
                            Query queries = pass.where("employeeID",
                                isEqualTo: passwordController.text.trim());
                            QuerySnapshot querySnapshott = await queries.get();
                            final docDataa = querySnapshott.docs
                                .map((doc) => doc.data())
                                .toList();
                            log(query.toString());
                            log(docDataa.toString());

                            if (docDataa.isNotEmpty && docData.isNotEmpty) {
                              print("object");
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ClassTeacherAdmin(
                                    schoolID: schoolID,
                                    teacherID: idController.text.trim(),
                                    teacherEmail: idController.text.trim(),
                                  );
                                },
                              ));
                              log('Correct password');
                            } else {
                              log('Wrong passwordsadfsdf');
                            }

                            // //>>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                            // CollectionReference cat = FirebaseFirestore.instance
                            //     .collection("FacultyProfiles");
                            // Query query = cat.where("facultyid",
                            //     isEqualTo: _facultyController.text.trim());
                            // QuerySnapshot querySnapshot = await query.get();
                            // final docData = querySnapshot.docs
                            //     .map((doc) => doc.data())
                            //     .toList();

                            // //
                            // //>>>>>>>>>>>>>>>>>>>Checking password<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                            // CollectionReference pass = FirebaseFirestore
                            //     .instance
                            //     .collection("FacultyProfiles");
                            // Query queries = pass.where("facultyPassword",
                            //     isEqualTo: _passwordController.text.trim());
                            // QuerySnapshot querySnapshott = await queries.get();
                            // final docDataa = querySnapshott.docs
                            //     .map((doc) => doc.data())
                            //     .toList();

                            // if (docDataa.isNotEmpty && docData.isNotEmpty) {
                            //   // Navigator.push(context, MaterialPageRoute(
                            //   //   builder: (context) {
                            //   //     return FacultyLiveCourseList();
                            //   //   },
                            //   // ));
                            //   log('Correct password');
                            // } else {
                            //   log('Wrong password');
                            // }
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: const Color(0xFF26A69A),
                            ),
                            child: Text(
                              'Sign In',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
