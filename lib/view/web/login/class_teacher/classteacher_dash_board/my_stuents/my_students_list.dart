import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/all_class_controller/all_class_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/attendance_controller/attendance_controller.dart';
import '../../../../../../controller/class_list/class_list_model.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/add_class/add_new_class.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../admin/admin_DashBoard/classes/details_ofClasses.dart';

class MyStudentsListViewScreen extends StatefulWidget {
  String NoofStundents = '';
  String NoofMaleStundets = '';
  String NoofFemaleStudents = '';
  MyStudentsListViewScreen({super.key});

  @override
  State<MyStudentsListViewScreen> createState() =>
      _MyStudentsListViewScreenState();
}

class _MyStudentsListViewScreenState extends State<MyStudentsListViewScreen> {
  AllClassController allClassController = Get.put(AllClassController());
  List<SchoolClassesModel> allData = [];
  int columnCount = 3;
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  final getxController = Get.put(ClassProfileList());
  @override
  Widget build(BuildContext context) {
    log("message");
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Classes List'),
          backgroundColor: adminePrimayColor),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
            .where('classTeacherdocid',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "M Y  S T U D E N T S",
                    style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        fontSize: 30.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                sizedBoxH20,
                Expanded(
                  child: Row(
                    children: [
                      ClassesDeatils(
                          width: 500,
                          noofFemale: widget.NoofFemaleStudents,
                          noofMale: widget.NoofMaleStundets,
                          totalStudents: widget.NoofStundents,
                          schooilID:
                              Get.find<AdminLoginScreenController>().schoolID,
                          getxController: getxController,
                          allData: allData),
                      Container(
                        height: double.infinity - 10,
                        width: 2,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: AnimationLimiter(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.all(w / 60),
                            crossAxisCount: columnCount,
                            children: List.generate(
                              snapshot.data!.docs.length,
                              (int index) {
                                SchoolClassesModel data =
                                    SchoolClassesModel.fromMap(
                                        snapshot.data!.docs[index].data());
                                allData.add(data);
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 300),
                                  columnCount: columnCount,
                                  child: ScaleAnimation(
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            attendanceController.classId.value =
                                                data.docid;
                                            allClassController.showclass(
                                                context,
                                                data.className,
                                                data.docid,
                                                data.classTeacherName!);
                                          },
                                          child: SizedBox(
                                            height: 400,
                                            width: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 60,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 210, 235, 255),
                                                    child: CircleAvatar(
                                                      radius: 50,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/classes.png'),
                                                    ),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "C L A S S ${index + 1}",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.grey,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  sizedBoxH10,
                                                  sizedBoxH10,
                                                  Text(
                                                    "Class : ${data.className}",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  sizedBoxH10,
                                                  Text(
                                                    "Class Incharge : ${data.classTeacherName}",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }

  Future<void> getStudntsCount() async {
    var a = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("Classes")
        .get();
    final data = a.docs.map((e) {
      return e.data()['id'];
    }).toList();
    int studentsLength = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('AllStudents')
          .get();

      studentsLength = studentsLength + b.docs.length;
    }
    setState(() {
      widget.NoofStundents = studentsLength.toString();
      print(studentsLength);
    });
  }

  Future<void> getMaleCount() async {
    var a = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("Classes")
        .get();
    final data = a.docs.map((e) {
      return e.data()['id'];
    }).toList();

    int maleCount = 0;
    int femaleCount = 0;

    for (int i = 0; i <= data.length - 1; i++) {
      var b = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("Classes")
          .doc(data[i])
          .collection('Students')
          .get();
      for (var element in b.docs) {
        if (element.data()['gender'] == 'male') {
          maleCount++;
        } else if (element.data()['gender'] == 'female') {
          femaleCount++;
        }
      }
    }

    // print(maleCount);
    // print(femaleCount);
    setState(() {
      widget.NoofMaleStundets = maleCount.toString();
      widget.NoofFemaleStudents = femaleCount.toString();
    });
  }
}
