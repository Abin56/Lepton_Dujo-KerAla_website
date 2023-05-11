import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/_manage_teachers/_manage_teachers.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../widgets/Iconbackbutton.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';

class AllClassesListViewForTeacher extends StatelessWidget {
  ManageTeachersController manageTeachersController =
      Get.put(ManageTeachersController());
  String schoolID;
  String classID;
  String teacherID;
  AllClassesListViewForTeacher(
      {required this.schoolID,
      required this.classID,
      required this.teacherID,
      super.key});

  @override
  Widget build(BuildContext context) {
    log(classID);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: adminePrimayColor,
      body: SingleChildScrollView(
          child: Row(
        children: [
          SizedBox(
            height: screenSize.height,
            width: screenSize.width * 1 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButtonBackWidget(color: cWhite),
                    SizedBox(
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    GoogleMonstserratWidgets(
                      text: '${Get.find<GetFireBaseData>().bYear.value} -Manage Teacher', ////changed normal text to original batch year
                      //'2023 -2024 batch',
                      fontsize: 17.w,
                      color: cWhite,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        // color: cBlue,
                        alignment: Alignment.centerLeft,
                        width: screenSize.width * 0.25,
                        child: Center(
                          child: GoogleMonstserratWidgets(
                            text: 'ClassTeacherName',
                            fontsize: 15.w,
                            color: cWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        // color: Colors.amber,
                        width: screenSize.width * 0.06,
                        child: Center(
                          child: GoogleMonstserratWidgets(
                              text: 'Manage teacher',
                              fontsize: 12.w,
                              color: cWhite,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      width: screenSize.width * 0.04,
                      child: Center(
                        child: GoogleMonstserratWidgets(
                            text: 'View',
                            fontsize: 14.w,
                            color: cWhite,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                      child: Center(
                        child: GoogleMonstserratWidgets(
                            text: 'Remove',
                            fontsize: 12.w,
                            color: cWhite,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('SchoolListCollection')
                        .doc(schoolListValue!['docid'])
                        .collection(Get.find<GetFireBaseData>().bYear.value)
                        .doc(Get.find<GetFireBaseData>().bYear.value)
                        .collection('classes')
                        .doc(Get.find<GetFireBaseData>()
                            .getTeacherClassRole
                            .value)
                        .collection('teachers')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: EdgeInsets.all(10.w),
                          color: cWhite,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 5.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 224, 219, 219),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.w),
                                      ),
                                    ),
                                    height: 65.w,
                                    width: 85.w,
                                    child: Container(
                                      height: 75.w,
                                      width: 90.w,
                                      margin: EdgeInsets.only(top: 15.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: screenSize.width * 0.25,
                                              child: GoogleMonstserratWidgets(
                                                  text: snapshot
                                                          .data?.docs[index]
                                                      ['teacherName'],
                                                  fontsize: 15.w,
                                                  color: cBlack,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.07,
                                            child: TextButton.icon(
                                                onPressed: () async {
                                                  manageTeachersController
                                                      .addSubjectsToTeacher(
                                                          context,
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['docid']);
                                                },
                                                icon:
                                                    const Icon(Icons.change_circle),
                                                label: const Text("Manage")),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            child: StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                        'SchoolListCollection')
                                                    .doc(schoolListValue![
                                                        'docid'])
                                                    .collection(
                                                        Get.find<GetFireBaseData>()
                                                            .bYear
                                                            .value)
                                                    .doc(Get.find<GetFireBaseData>()
                                                        .bYear
                                                        .value)
                                                    .collection('classes')
                                                    .doc(Get.find<
                                                            GetFireBaseData>()
                                                        .getTeacherClassRole
                                                        .value)
                                                    .collection('teachers')
                                                    .doc(snapshot.data!
                                                        .docs[index]['docid'])
                                                    .collection(
                                                        'teacherSubject')
                                                    .where('teacherdocid',
                                                        isEqualTo: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['docid'])
                                                    .snapshots(),
                                                builder: (context, snap) {
                                                  if (snap.hasData) {
                                                    if (snap
                                                        .data!.docs.isEmpty) {
                                                      return GoogleMonstserratWidgets(
                                                          text:
                                                              '<-Addsubject',
                                                          fontsize: 12.w);
                                                    } else {
                                                      return GestureDetector(
                                                        onTap: () async {
                                                          manageTeachersController
                                                              .viewTeacherSubjects(
                                                                  context,
                                                                  snapshot.data!
                                                                          .docs[index]
                                                                      [
                                                                      'docid']);
                                                        },
                                                        child:
                                                            GoogleMonstserratWidgets(
                                                                text: 'View',
                                                                fontsize:
                                                                    14.w,
                                                                color: cBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      );
                                                    }
                                                  } else {
                                                    return const Text('');
                                                  }
                                                }),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 5.w),
                                            // color: cred,
                                            width: screenSize.width * 0.07,
                                            child: TextButton.icon(
                                                onPressed: () async {
                                                  await manageTeachersController
                                                      .removeTeacher(
                                                          context,
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['docid']);
                                                },
                                                icon: const Icon(Icons.remove),
                                                label:
                                                    GoogleMonstserratWidgets(
                                                  text: 'Remove Teacher',
                                                  fontsize: 13.w,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.docs.length),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: screenSize.height,
            width: screenSize.width * 1 / 2,
            child: Column(
              children: [
                SizedBox(height: 20.w),
                GoogleMonstserratWidgets(
                  text: '${Get.find<GetFireBaseData>().bYear.value} -Teacher List', ////changed normal text to original batch year
                  //'2023 -2024 batch',
                  fontsize: 17.w,
                  color: cBlack,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20.w),
                SizedBox(
                  height: 600.w,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("SchoolListCollection")
                        .doc(schoolID)
                        .collection("Teachers")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = TeacherModel.fromMap(
                                snapshot.data!.docs[index].data());

                            return Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            const Color.fromARGB(211, 122, 117, 117)
                                                .withOpacity(0.5),
                                        spreadRadius: 10,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.w),
                                    )),
                                height: 80.w,
                                width: 160.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GoogleMonstserratWidgets(
                                        text: data.teacherName!,
                                        fontsize: 17.w,
                                        fontWeight: FontWeight.w500),
                                    GestureDetector(
                                      onTap: () async {
                                        manageTeachersController
                                            .addteachersToClass(
                                                snapshot.data!.docs[index]
                                                    ['docid'],
                                                snapshot.data!.docs[index]
                                                    ['teacherName']);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue
                                                  .withOpacity(0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.w))),
                                          width: 105.w,
                                          height: 32.w,
                                          child: Center(
                                              child: GoogleMonstserratWidgets(
                                            text: 'Add to teacher',
                                            fontsize: 10.w,
                                            color: cBlack,
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
