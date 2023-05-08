import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/_manage_teachers/_manage_teachers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../colors/colors.dart';
import '../../../../widgets/drop_DownList/schoolDropDownList.dart';
import 'class_subjects.dart';

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
    return Scaffold(
      appBar: AppBar(
          title: const Text("Add teachers for the subject"),
          backgroundColor: adminePrimayColor),
      body: SafeArea(
          child: Row(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolListValue!['docid'])
                .collection(Get.find<GetFireBaseData>().bYear.value)
                .doc(Get.find<GetFireBaseData>().bYear.value)
                .collection('classes')
                .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
                .collection('teachers')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          width: double.infinity,
                          color: Colors.amber,
                          child: Row(
                            children: [
                              Text(snapshot.data?.docs[index]['teacherName']),
                              TextButton.icon(
                                  onPressed: () async {
                                    manageTeachersController
                                        .addSubjectsToTeacher(
                                            context,
                                            snapshot.data!.docs[index]
                                                ['docid']);
                                  },
                                  icon: Icon(Icons.change_circle),
                                  label: Text("Manage")),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('SchoolListCollection')
                                      .doc(schoolListValue!['docid'])
                                      .collection(Get.find<GetFireBaseData>()
                                          .bYear
                                          .value)
                                      .doc(Get.find<GetFireBaseData>()
                                          .bYear
                                          .value)
                                      .collection('classes')
                                      .doc(Get.find<GetFireBaseData>()
                                          .getTeacherClassRole
                                          .value)
                                      .collection('teachers')
                                      .doc(snapshot.data!.docs[index]['docid'])
                                      .collection('teacherSubject')
                                      .where('teacherdocid',
                                          isEqualTo: snapshot.data!.docs[index]
                                              ['docid'])
                                      .snapshots(),
                                  builder: (context, snap) {
                                    if (snap.hasData) {
                                      if (snap.data!.docs.isEmpty) {
                                        return const Text('');
                                      } else {
                                        return GestureDetector(
                                            onTap: () async {
                                              manageTeachersController
                                                  .viewTeacherSubjects(
                                                      context,
                                                      snapshot.data!.docs[index]
                                                          ['docid']);
                                            },
                                            child: const Text('View'));
                                      }
                                    } else {
                                      return const Text('');
                                    }
                                  }),
                              TextButton.icon(
                                  onPressed: () async {
                                    await manageTeachersController
                                        .removeTeacher(
                                            context,
                                            snapshot.data!.docs[index]
                                                ['docid']);
                                  },
                                  icon: Icon(Icons.remove),
                                  label: Text('Remove Teacher'))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: snapshot.data!.docs.length),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(schoolID)
                .collection("Teachers")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = TeacherModel.fromMap(
                            snapshot.data!.docs[index].data());

                        return Container(
                          height: 60,
                          width: double.infinity,
                          color: Colors.amber,
                          child: Row(
                            children: [
                              Text(data.teacherName!),
                              TextButton.icon(
                                  onPressed: () async {
                                    manageTeachersController.addteachersToClass(
                                        snapshot.data!.docs[index]['docid'],
                                        snapshot.data!.docs[index]
                                            ['teacherName']);
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add'))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
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
        ],
      )),
    );
  }
}
