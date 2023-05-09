// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_subject/subject_controller.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/google_monstre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../colors/colors.dart';
import '../../../../widgets/Iconbackbutton.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';

class SubmitSubjectClassTeacher extends StatelessWidget {
  final getxcontroller = Get.find<GetFireBaseData>();
  final GlobalKey<FormState> addFormkey = GlobalKey<FormState>();
  SubjectController subjectControllerr = Get.put(SubjectController());
  SubmitSubjectClassTeacher({
    super.key,
    required this.schoolID,
    required this.teacherClassId,
  });
  TextEditingController subjecController = TextEditingController();
  final String schoolID;
  final String teacherClassId;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: addFormkey,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Row(children: [
            Container(
              color: const Color.fromARGB(255, 12, 34, 133),
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
                        width: 50.w,
                      ),
                      GoogleMonstserratWidgets(
                          text: Get.find<GetFireBaseData>().bYear.value,
                          fontsize: 18,
                          color: cWhite),
                    ],
                  ),
                  Expanded(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('SchoolListCollection')
                              .doc(schoolListValue!['docid'])
                              .collection(
                                  Get.find<GetFireBaseData>().bYear.value)
                              .doc(Get.find<GetFireBaseData>().bYear.value)
                              .collection('classes')
                              .doc(Get.find<GetFireBaseData>()
                                  .getTeacherClassRole
                                  .value)
                              .collection('subjects')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                                return ListView.separated(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.h,
                                        left: 50.w,
                                        right: 50.w,
                                        bottom: 20.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: cWhite.withOpacity(0.9),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      height: 100.h,
                                      width: 150.w,
                                      child: Column(
                                        children: [
                                          Center(
                                              child: GoogleMonstserratWidgets(
                                            text: snapshot.data?.docs[index]
                                                ['subjectName'],
                                            fontsize: 20.w,
                                            fontWeight: FontWeight.w600,
                                          )
                                              // Text(),
                                              ),
                                          GestureDetector(
                                            onTap: ()async {
                                              subjectControllerr.deleteYearWiseSubject(snapshot.data?.docs[index]
                                                ['docid'], context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 35.h, right: 10.w),
                                              height: 28.h,
                                              width: 80.w,
                                              decoration: BoxDecoration(
                                                  color: cred.withOpacity(0.9),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(2))),
                                              child: Center(
                                                  child: GoogleMonstserratWidgets(
                                                      text: "Delete",
                                                      fontsize: 12.w,
                                                      color: cWhite)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: snapshot.data!.docs.length);
                              
                            }else{
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          
                          })),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenSize.width / 8,
              ),
              child: SizedBox(
                height: screenSize.height * 1 / 1,
                width: screenSize.width * 1 / 3,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: SizedBox(
                        width: 500.h,
                        //height: screenSize.width/30,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: const Border()),
                              child: TextFormField(
                                validator: (value) {
                                  if (subjecController.text.isEmpty) {
                                    return 'Invalid';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: subjecController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    hintText: 'Enter Name of Subject',
                                    prefixIcon: const Icon(
                                        Icons.subject_rounded,
                                        color:
                                            Color.fromARGB(255, 14, 11, 168)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(19),
                                      borderSide: const BorderSide(),
                                    )),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                height: 50.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton.icon(
                                    onPressed: () async {
                                      if (addFormkey.currentState!.validate()) {
                                        subjectControllerr
                                            .addSubjectInClassWise(
                                                subjecController);
                                      }
                                    },
                                    icon: const Icon(Icons.add),
                                    label: GoogleMonstserratWidgets(
                                      text: 'Add',
                                      fontsize: 15,
                                      color: cWhite,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                            sizedBoxH10,
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 700.h,
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('SchoolListCollection')
                                      .doc(schoolListValue!['docid'])
                                      .collection("classes")
                                      .doc(Get.find<GetFireBaseData>()
                                          .getTeacherClassRole
                                          .value)
                                      .collection("subjects")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.separated(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                log(snapshot.data!.docs[index]
                                                    ['docid']);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(10.w),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  6,
                                                                  71,
                                                                  157)
                                                              .withOpacity(0.9),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20.w),
                                                      )),
                                                  // color: Colors.amber,
                                                  height: 225.h,
                                                  width: 140.w,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      GoogleMonstserratWidgets(
                                                          text: snapshot.data!
                                                                  .docs[index]
                                                              ['subjectName'],
                                                          fontsize: 18,
                                                          color: cWhite),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () async {
                                                            subjectControllerr.addSubjectToNewBatch(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ['docid'],
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'subjectName']);
                                                          },
                                                          child: Container(
                                                              height: 45.h,
                                                              width: 160.w,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue
                                                                      .withOpacity(
                                                                          0.5),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              15))),
                                                              child: Center(
                                                                child:
                                                                    GoogleMonstserratWidgets(
                                                                  text:
                                                                      "+ Add subject",
                                                                  fontsize:
                                                                      16.w,
                                                                  color: cWhite,
                                                                ),
                                                              ))),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                log(Get.find<
                                                                        GetFireBaseData>()
                                                                    .getTeacherClassRole
                                                                    .value);
                                                                await subjectControllerr.editClassName(
                                                                    context,
                                                                    snapshot.data!
                                                                            .docs[index]
                                                                        [
                                                                        'subjectName'],
                                                                    Get.find<
                                                                            GetFireBaseData>()
                                                                        .getTeacherClassRole
                                                                        .value,
                                                                    snapshot.data!
                                                                            .docs[index]
                                                                        [
                                                                        'docid']);
                                                              },
                                                              child: Container(
                                                                height: 35.h,
                                                                width: 80.w,
                                                                decoration: BoxDecoration(
                                                                    color: cgreen
                                                                        .withOpacity(
                                                                            0.9),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(2))),
                                                                child: Center(
                                                                    child: GoogleMonstserratWidgets(
                                                                        text:
                                                                            "Edit",
                                                                        fontsize:
                                                                            10,
                                                                        color:
                                                                            cWhite)),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                subjectControllerr
                                                                    .deleteClass(
                                                                        snapshot
                                                                            .data!
                                                                            .docs[index]['docid'],
                                                                        context);
                                                              },
                                                              child: Container(
                                                                height: 35.h,
                                                                width: 80.w,
                                                                decoration: BoxDecoration(
                                                                    color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            0,
                                                                            0)
                                                                        .withOpacity(
                                                                            0.7),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(2))),
                                                                child: Center(
                                                                    child: GoogleMonstserratWidgets(
                                                                        text:
                                                                            "Delete",
                                                                        fontsize:
                                                                            10,
                                                                        color:
                                                                            cWhite)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const Divider();
                                          },
                                          itemCount:
                                              snapshot.data!.docs.length);
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ]),
        ])),
      ),
    );
  }
}
