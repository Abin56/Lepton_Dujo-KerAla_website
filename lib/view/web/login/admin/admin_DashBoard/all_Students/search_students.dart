import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/search_student/search_student.dart';
import '../../../../../../model/create_classModel/add_student_model.dart';
import '../../../../../../ui team/sruthi/parent_guardian_alert_box_widget.dart';
import '../../../../../../ui team/sruthi/student_details_alert_box_widget.dart';

class SearchStuents extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection("AllStudents")
            .where('admissionNumber', isEqualTo: query)
            .snapshots(),
        builder: (context, snapshots) {
          var screenSize = MediaQuery.of(context).size;
          if (snapshots.hasData) {
            return Scaffold(
              // backgroundColor: Colors.transparent,
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    AddStudentModel data = AddStudentModel.fromMap(
                        snapshots.data!.docs[index].data());
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.grey,width: 0.5),
                        ),
                        height: screenSize.width / 8,
                        width: double.infinity,
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  log(data.profileImageUrl ?? "mmmmmmmmmm");
                                  _showlert(context, data);
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                )),
                            sizedBoxw40,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(snapshots.data!.docs[index]['id']),
                                  Text(
                                    data.studentName!,
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  sizedBoxH10,
                                  Text(
                                    'Admission No. :${data.admissionNumber}',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                  sizedBoxH10,

                                  Text(
                                    'Class & Division : ${data.classID}',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                  sizedBoxH10,
                                  Text(
                                    'Phone No :${data.guardianID}',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshots.data!.docs.length),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(Get.find<AdminLoginScreenController>().schoolID)
                .collection("AllStudents")
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                var screenSize = MediaQuery.of(context).size;
                return Scaffold(
                  // backgroundColor: Colors.transparent,
                  body: ListView.separated(
                      itemBuilder: (context, index) {
                        AddStudentModel data = AddStudentModel.fromMap(
                            snapshots.data!.docs[index].data());
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.grey,width: 0.5),
                            ),
                            height: screenSize.width / 8,
                            width: double.infinity,
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      log(data.profileImageUrl ?? "mmmmmmmmmm");
                                      _showlert(context, data);
                                    },
                                    child: CircleAvatar(
                                      radius: 60,
                                    )),
                                sizedBoxw40,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(snapshots.data!.docs[index]['id']),
                                      Text(
                                        data.studentName!,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                      sizedBoxH10,
                                      Text(
                                        'Admission No. :${data.admissionNumber}',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                      sizedBoxH10,

                                      Text(
                                        'Class & Division : ${data.classID}',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                      sizedBoxH10,
                                      Text(
                                        'Phone No :${data.guardianID}',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            })
        : StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(Get.find<AdminLoginScreenController>().schoolID)
                .collection("AllStudents")
                .where('admissionNumber', isEqualTo: query)
                .snapshots(),
            builder: (context, snapshots) {
              var screenSize = MediaQuery.of(context).size;
              if (snapshots.hasData) {
                return Scaffold(
                  // backgroundColor: Colors.transparent,
                  body: ListView.separated(
                      itemBuilder: (context, index) {
                        AddStudentModel data = AddStudentModel.fromMap(
                            snapshots.data!.docs[index].data());
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.grey,width: 0.5),
                            ),
                            height: screenSize.width / 8,
                            width: double.infinity,
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      log(data.profileImageUrl ?? "mmmmmmmmmm");
                                      _showlert(context, data);
                                    },
                                    child: CircleAvatar(
                                      radius: 60,
                                    )),
                                sizedBoxw40,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(snapshots.data!.docs[index]['id']),
                                      Text(
                                        data.studentName!,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                      sizedBoxH10,
                                      Text(
                                        'Admission No. :${data.admissionNumber}',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                      sizedBoxH10,

                                      Text(
                                        'Class & Division : ${data.classID}',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                      sizedBoxH10,
                                      Text(
                                        'Phone No :${data.guardianID}',
                                        style:
                                            GoogleFonts.poppins(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
  }
}

void _showlert(BuildContext context, AddStudentModel data) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Student_Details_AlertBox_Widget(
        studentID: data.docid??"",
            studentImage: data.profileImageUrl ?? "",
            studentName: data.studentName ?? "",
            studentClass: data.classID ?? "",
            admissionNumber: data.admissionNumber ?? "",
            studentGender: data.gender ?? "",
            bloodGroup: data.bloodgroup ?? "",
            studentEmail: data.studentemail ?? "",
            houseName: data.houseName ?? "",
            place: data.place ?? "",
            district: data.district ?? "",
          ));
}
