import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/ui%20team/sruthi/parent_guardian_alert_box_widget.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/classes/students/student_summery.dart/student_summery.dart';
import 'package:dujo_kerala_website/view/web/login/admin/admin_DashBoard/transfer_cretificate/tc_genrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../controller/get_firebase-data/get_firebase_data.dart';
import '../../view/colors/colors.dart';
import '../../view/constant/constant.dart';
import '../../view/web/widgets/Iconbackbutton.dart';
import '../../view/web/widgets/sample/under_maintance.dart';
import 'guardianInfo_alert_box.dart';

class Student_Details_AlertBox_Widget extends StatelessWidget {
  final controller = Get.put(GetFireBaseData());
  String studentID;
  String studentName;
  String studentClass;
  String admissionNumber;
  String studentGender;
  String bloodGroup;
  String studentEmail;
  String houseName;
  String place;
  String district;
  String? studentImage;

  Student_Details_AlertBox_Widget({
    required this.studentID,
    required this.studentName,
    required this.studentClass,
    required this.admissionNumber,
    required this.studentGender,
    required this.bloodGroup,
    required this.studentEmail,
    required this.houseName,
    required this.place,
    required this.district,
    this.studentImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log(studentImage ?? "adsgdfg");
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Container(
          color: adminePrimayColor,
          child: Row(
            children: [
              IconButtonBackWidget(color: cWhite),
              Text(' Student Details',
                  style: GoogleFonts.poppins(fontSize: 16.h, color: cWhite)),
            ],
          )),
      content: SizedBox(
        width: 650.w,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: studentImage == null
                      ? LottieBuilder.network(
                          'https://assets4.lottiefiles.com/packages/lf20_u7yrcwlk.json')
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(studentImage ?? "")),
                )
              ],
            ),
            sizedBoxH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        color: adminePrimayColor,
                        child: Center(
                          child: Text(' Personal Info ',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.h, color: cWhite)),
                        )),
                    sizedBoxH20,
                    Student_Info_text_Widget(
                      text: 'Name :$studentName',
                    ),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Adm.No:$admissionNumber'),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Gender : $studentGender'),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Blood Group :$bloodGroup'),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Email : $studentEmail'),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'House Name : $houseName'),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'Place :$place'),
                    sizedBoxH20,
                    Student_Info_text_Widget(text: 'District: $district'),
                    sizedBoxH20,
                  ],
                ),
                sizedBoxw40,
                Column(
                  children: [
                    Container(
                        width: 300.w,
                        height: 390.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: Column(children: [
                          Container(
                              color: adminePrimayColor,
                              child: Text(' Academics Info ',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.h, color: cWhite))),
                          Obx(() {
                            controller.getClassDetail(studentClass);

                            if (controller.className.isEmpty) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              // log("classsIDDD${controller.classIncharge.value}");
                              controller.getTeacherDetail(
                                  controller.classTeacherdocid.value);
                              return ListTile(
                                  leading: const Icon(Icons.class_),
                                  title: const Student_Info_text_Widget(
                                      text: "Class"),
                                  subtitle: Student_Info_text_Widget(
                                      text: controller.className.value));
                            }
                          }),
                          Obx(() {
                            if (controller.teacherName.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              controller.getTeacherDetail(
                                  controller.classTeacherdocid.value);
                              return ListTile(
                                leading: const Icon(Icons.person),
                                title: const Student_Info_text_Widget(
                                    text: "Class Incharge"),
                                subtitle: Student_Info_text_Widget(
                                    text: controller.teacherName.value),
                              );
                            }
                          }),
                          ListTile(
                            leading: const Icon(Icons.format_list_numbered),
                            title: const Student_Info_text_Widget(
                                text: "Admission No"),
                            subtitle:
                                Student_Info_text_Widget(text: admissionNumber),
                          ),
                          sizedBoxH20,
                          Student_Info_Elevated_button_Widget(
                            text: 'Generate TC',
                            onPressed: () {
                              genrateTc(context);
                            },
                          ),
                          sizedBoxH10,
                          Student_Info_Elevated_button_Widget(
                            text: 'promote Class',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UnderMaintanceScreen(),
                                  ));
                            },
                          ),
                          sizedBoxH10,
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("SchoolListCollection")
                                  .doc(Get.find<AdminLoginScreenController>()
                                      .schoolID)
                                  .collection("AllStudents")
                                  .doc(studentID)
                                  .collection("sampoorna")
                                  .where('admissionNumber',
                                      isEqualTo: admissionNumber)
                                  .snapshots(),
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  if (snap.data!.docs.isEmpty) {
                                    return const Text('');
                                  } else {
                                    return Student_Info_Elevated_button_Widget(
                                      text: 'View Summary',
                                      onPressed: () async {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return StundentSummery(
                                                studentId: studentID,
                                                stundetAdmissionId:
                                                    admissionNumber);
                                          },
                                        ));
                                      },
                                    );
                                  }
                                } else {
                                  return const Text('');
                                }
                              }),
                        ]))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      actions: [
        Student_Info_Elevated_button_Widget(
          text: ('Parent Info'),
          onPressed: () {
            _showParentAlertbox(context, studentID);
          },
        ),
        Student_Info_Elevated_button_Widget(
          text: ('Guardian Info'),
          onPressed: () {
            _showGuardianAlertbox(context, studentID);
          },
        ),
        Student_Info_Elevated_button_Widget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Cancel',
        ),
      ],
    );
  }

  genrateTc(BuildContext context) async {
    TextEditingController sController = TextEditingController();
    TextEditingController regController = TextEditingController();
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gentrate Tc'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter S.No'),
                    controller: sController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter Reg.No'),
                    controller: regController,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Obx(() {
                controller.getParentDetail(studentID);
                controller.getSchoolDetail();
                if (controller.schoolName.value.isEmpty &&
                    controller.placeNameofSchool.value.isEmpty &&
                    controller.parentNAme.value.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      // Get.to(GenrateTC(
                      //     sno: sController.text.trim(),
                      //     regNo: regController.text.trim(),
                      //     parentName: controller.parentNAme.value,
                      //     studentName: studentName,
                      //     schoolName: controller.schoolName.value,
                      //     schoolPlace: controller.placeNameofSchool.value));
                    },
                  );
                }
              }),
            ],
          );
        });
  }

  void _showParentAlertbox(BuildContext context, String studentID) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => ParentAlert_box_Widget(
        classID: studentClass,
        studentID: studentID,
        text: 'Parent Info',
      ),
    );
  }

  void _showGuardianAlertbox(BuildContext context, String studentID) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => GuardianInfoAlert_box_Widget(
        classID: studentClass,
        studentID: studentID,
        text: 'Guardian Info',
      ),
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
