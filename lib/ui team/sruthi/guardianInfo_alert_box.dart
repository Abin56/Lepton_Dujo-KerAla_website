import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/ui%20team/sruthi/parent_guardian_alert_box_widget.dart';
import 'package:dujo_kerala_website/ui%20team/sruthi/student_details_alert_box_widget.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../view/colors/colors.dart';
import '../../view/constant/constant.dart';

class GuardianInfoAlert_box_Widget extends StatelessWidget {
  String studentID;

  GuardianInfoAlert_box_Widget({
    required this.studentID,
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: AlertDialog(
          title: Container(
              color: adminePrimayColor,
              child: Row(
                children: [
                  IconButtonBackWidget(color: cWhite),
                  Text('Parent Details',
                      style:
                          GoogleFonts.poppins(fontSize: 16.h, color: cWhite)),
                ],
              )),
          content: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("SchoolListCollection")
                  .doc(Get.find<AdminLoginScreenController>().schoolID)
                  .collection("Student_Guardian")
                  .where('studentID', isEqualTo: studentID)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  snapshot.data!.docs[0]['profileImageURL'] ??
                                      ""),
                            )
                          ],
                        ),
                      ),
                      Student_Info_text_Widget(
                          text:
                              "Name : ${snapshot.data!.docs[0]['guardianName']}"),
                      sizedBoxH10,
                      Student_Info_text_Widget(
                          text:
                              "Phone No. :${snapshot.data!.docs[0]['guardianPhoneNumber']}"),
                      sizedBoxH10,
                      Student_Info_text_Widget(
                          text: "Gender :${snapshot.data!.docs[0]['gender']}"),
                      sizedBoxH10,
                      Student_Info_text_Widget(
                          text:
                              "Email :${snapshot.data!.docs[0]['guardianEmail']}"),
                      sizedBoxH10,
                      Student_Info_text_Widget(
                          text:
                              "House Name :${snapshot.data!.docs[0]['houseName']}"),
                      sizedBoxH10,
                      Student_Info_text_Widget(
                          text: "Place :${snapshot.data!.docs[0]['place']}"),
                      sizedBoxH10,
                    ],
                  );
                } else {
                  return const Center(child:  CircularProgressIndicator());
                }
              }),
          actions: [
            Student_Info_Elevated_button_Widget(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancel',
            )
          ]),
    );
  }
}


// void _showAlert(BuildContext context) {
//   var screenSize = MediaQuery.of(context).size;
//   showDialog(
//     context: context,
//     builder: (context) => Student_Details_AlertBox_Widget(),
//   );
// }


