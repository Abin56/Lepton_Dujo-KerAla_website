// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/add_subject/subject_controller.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
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
                  IconButtonBackWidget(color: cWhite),
                  Text(Get.find<GetFireBaseData>().bYear.value),
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
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 80,
                                    color: Colors.amber,
                                    child: Text(snapshot.data?.docs[index]
                                        ['subjectName']),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: snapshot.data!.docs.length);
                          })),
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
                                if (addFormkey.currentState!.validate()) {
                                  subjectControllerr
                                      .addSubjectInClassWise(subjecController);
                                }
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Add')),
                          sizedBoxH10,
                          SizedBox(
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
                                          return GestureDetector(
                                            onTap: () {
                                              log(snapshot.data!.docs[index]
                                                  ['docid']);
                                            },
                                            child: Container(
                                              color: Colors.amber,
                                              height: 60,
                                              child: Row(
                                                children: [
                                                  Text(
                                                      snapshot.data!.docs[index]
                                                          ['subjectName']),
                                                  IconButton(
                                                      onPressed: () async {
                                                        log(Get.find<
                                                                GetFireBaseData>()
                                                            .getTeacherClassRole
                                                            .value);
                                                        await subjectControllerr.editClassName(
                                                            context,
                                                            snapshot.data!
                                                                    .docs[index]
                                                                ['subjectName'],
                                                            Get.find<
                                                                    GetFireBaseData>()
                                                                .getTeacherClassRole
                                                                .value,
                                                            snapshot.data!
                                                                    .docs[index]
                                                                ['docid']);
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit)),
                                                  IconButton(
                                                      onPressed: () async {
                                                        subjectControllerr
                                                            .deleteClass(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ['docid'],
                                                                context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete)),
                                                  TextButton.icon(
                                                      onPressed: () async {
                                                        subjectControllerr
                                                            .addSubjectToNewBatch(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ['docid'],
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'subjectName']);
                                                      },
                                                      icon: Icon(Icons.add),
                                                      label:
                                                          Text("Add subject"))
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const Divider();
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
      ),
    );
  }
}
