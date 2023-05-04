// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_subject/subject_controller.dart';
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
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';

class SubmitSubjectClassTeacher extends StatelessWidget {
  final getxcontroller = Get.find<GetFireBaseData>();
  SubjectController subjectController = Get.put(SubjectController());
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
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container();
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: 0)),
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
                    width: 500.h,
                    //height: screenSize.width/30,
                    child: Column(
                      children: [
                        Container(
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
                        TextButton.icon(
                            onPressed: () async {
                              subjectController
                                  .addSubjectInClassWise(subjecController);
                            },
                            icon: Icon(Icons.add),
                            label: Text('Add')),
                        sizedBoxH10,
                        Container(
                          height: 500,
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
                                        return Container(
                                          color: Colors.amber,
                                          height: 60,
                                          child: Row(
                                            children: [
                                              Text(snapshot.data?.docs[index]
                                                  ['subjectName']),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.edit)),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.delete))
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider();
                                      },
                                      itemCount: snapshot.data!.docs.length);
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
                ]),
              ),
            ),
          )
        ]),
      ])),
    );
  }
}
