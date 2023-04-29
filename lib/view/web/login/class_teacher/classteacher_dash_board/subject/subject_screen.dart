// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/class_teacher/add_subject/add_subjects.dart';
import '../../../../../colors/colors.dart';
import '../../../../../fonts/fonts.dart';
import '../../../../widgets/Iconbackbutton.dart';

class SubmitSubjectClassTeacher extends StatelessWidget {
  final getxcontroller = Get.find<GetFireBaseData>();
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
    return Scaffold(
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
                IconButtonBackWidget(color: cWhite),
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hi Admin ',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: screenSize.width / 20,
                          ),
                          Text(
                            'Welcome',
                            style: GoogleFonts.aclonica(
                              fontSize: 25.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: screenSize.width / 3.5,
                            width: screenSize.width / 1,
                            child: LottieBuilder.network(
                                "https://assets6.lottiefiles.com/packages/lf20_KWUxUaGUE7.json"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenSize.width / 8),
            child: SizedBox(
              height: screenSize.height * 1 / 1,
              width: screenSize.width * 1 / 3,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    width: 500.h,
                    //height: screenSize.width/30,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: screenSize.width / 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: const Border()),
                          child: TextFormField(
                            controller: subjecController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'Enter Name of Subject',
                                prefixIcon: const Icon(Icons.subject_rounded,
                                    color: Color.fromARGB(255, 14, 11, 168)),
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
                        sizedBoxH10,
                        Obx(() {
                          getxcontroller
                              .addSubjectforGetClassID(teacherClassId);

                          if (getxcontroller
                              .classIDForaddSubject.value.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return TextButton.icon(
                                onPressed: () async {
                                  log("Classs Id${getxcontroller.classIDForaddSubject.value}");
                                  final data = AddSubjectModel(
                                      subjectName: subjecController.text.trim(),
                                      docid: '');
                                  await AddSubjectsToFireBase()
                                      .addSubjectsController(
                                        data,
                                        context,
                                        getxcontroller
                                            .classIDForaddSubject.value,
                                      )
                                      .then(
                                          (value) => subjecController.clear());
                                },
                                icon: const Icon(Icons.add),
                                label: const Text('Add Subject'));
                          }
                        }),
                        Obx(
                            () =>
                                getxcontroller
                                        .classIDForaddSubject.value.isEmpty
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SizedBox(
                                        height: 500,
                                        child: StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection(
                                                    "SchoolListCollection")
                                                .doc(Get.find<
                                                        AdminLoginScreenController>()
                                                    .schoolID)
                                                .collection(Get
                                                        .find<GetFireBaseData>()
                                                    .bYear
                                                    .value)
                                                .doc(Get
                                                        .find<GetFireBaseData>()
                                                    .bYear
                                                    .value)
                                                .collection("Classes")
                                                .doc(getxcontroller
                                                    .classIDForaddSubject.value)
                                                .collection("subjects")
                                                .orderBy('subjectName',
                                                    descending: false)
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return ListView.separated(
                                                    itemBuilder:
                                                        (context, index) {
                                                      AddSubjectModel data =
                                                          AddSubjectModel
                                                              .fromMap(snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .data());
                                                      return SizedBox(
                                                        height: 60,
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                  '${index + 1}  '),
                                                              Text(data
                                                                  .subjectName),
                                                              sizedBoxw10,
                                                              IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      barrierDismissible:
                                                                          false, // user must tap button!
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        TextEditingController
                                                                            subNewController =
                                                                            TextEditingController();
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Change Subject Name'),
                                                                          content:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                ListBody(
                                                                              children: <Widget>[
                                                                                TextFormField(
                                                                                  controller: subNewController,
                                                                                  decoration: InputDecoration(hintText: data.subjectName),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          actions: <
                                                                              Widget>[
                                                                            TextButton(
                                                                              child: const Text('cancel'),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              child: const Text('ok'),
                                                                              onPressed: () async {
                                                                                FirebaseFirestore.instance.collection("SchoolListCollection").doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection("Classes").doc(getxcontroller.classIDForaddSubject.value).collection("subjects").doc(data.docid).update({
                                                                                  'subjectName': subNewController.text.trim()
                                                                                }).then((value) => Navigator.pop(context));
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.edit,
                                                                    color: Colors
                                                                        .green,
                                                                    size: 15,
                                                                  )),
                                                              IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      barrierDismissible:
                                                                          false, // user must tap button!
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        TextEditingController();
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Alert'),
                                                                          content:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                ListBody(
                                                                              children: const <Widget>[
                                                                                Text("Once Delete a subject all Data Will be Lost \n Are you sure ? ")
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          actions: <
                                                                              Widget>[
                                                                            TextButton(
                                                                              child: const Text('cancel'),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              child: const Text('ok'),
                                                                              onPressed: () async {
                                                                                FirebaseFirestore.instance.collection("SchoolListCollection").doc(Get.find<AdminLoginScreenController>().schoolID).collection(Get.find<GetFireBaseData>().bYear.value).doc(Get.find<GetFireBaseData>().bYear.value).collection("Classes").doc(getxcontroller.classIDForaddSubject.value).collection("subjects").doc(data.docid).delete().then((value) => Navigator.pop(context));
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  // ignore: prefer_const_constructors
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 15,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return const Divider();
                                                    },
                                                    itemCount: snapshot
                                                        .data!.docs.length);
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            }),
                                      ))
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          )
        ]),
      ])),
    );
  }
}
