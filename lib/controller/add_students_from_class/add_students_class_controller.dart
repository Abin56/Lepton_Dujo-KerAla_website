import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/create_classModel/add_student_model.dart';

class AddStudentsFromClassController extends GetxController {
  Future<void> addStudentsFromClass(BuildContext context, String schoolId,
      String batchId, String teacherClassID) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolId)
                .collection(batchId)
                .doc(batchId)
                .collection('classes')
                .snapshots(),
            builder: (context, snaps) {
              if (snaps.hasData) {
                return AlertDialog(
                  title: const Text('Select Class'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        SizedBox(
                          height: 500,
                          width: 500,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    selectStudents(
                                        context,
                                        schoolId,
                                        batchId,
                                        snaps.data!.docs[index]['docid'],
                                        teacherClassID);
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 200,
                                    color: index % 2 == 0
                                        ? Colors.grey.withOpacity(0.3)
                                        : Colors.white,
                                    child: Row(
                                      children: [
                                        Text('${index + 1}'),
                                        sizedBoxW20,
                                        Text(snaps.data!.docs[index]
                                            ['className'])
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 05,
                                );
                              },
                              itemCount: snaps.data!.docs.length),
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
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
      },
    );
  }

  selectStudents(BuildContext context, String schoolId, String batchId,
      String classID, String teacherClassID) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolId)
                .collection(batchId)
                .doc(batchId)
                .collection('classes')
                .doc(classID)
                .collection('Students')
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return AlertDialog(
                  title: const Text('Select Class'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        SizedBox(
                          height: 600,
                          width: 600,
                          child: ListView.separated(
                              itemBuilder: (context, index2) {
                                return GestureDetector(
                                  onTap: () async {
                                    selectStudents(
                                        context,
                                        schoolId,
                                        batchId,
                                        snapshots.data!.docs[index2]['docid'],
                                        teacherClassID);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 600,
                                    color: index2 % 2 == 0
                                        ? Colors.grey.withOpacity(0.2)
                                        : const Color.fromARGB(
                                                255, 255, 210, 210)
                                            .withOpacity(0.3),
                                    child: Row(
                                      children: [
                                        Text('${index2 + 1}'),
                                        sizedBoxW20,
                                        Text(snapshots.data!.docs[index2]
                                            ['studentName']),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () async {
                                              await addStudentsFromClassController(
                                                  schoolId,
                                                  batchId,
                                                  classID,
                                                  teacherClassID,
                                                  snapshots.data!.docs[index2]
                                                      ['docid'],
                                                  snapshots.data!.docs[index2]
                                                      ['studentName']);
                                            },
                                            icon: const Icon(Icons.add))
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index2) {
                                return const SizedBox(
                                  height: 05,
                                );
                              },
                              itemCount: snapshots.data!.docs.length),
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
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            });
      },
    );
  }

  addStudentsFromClassController(
      String schoolId,
      String batchId,
      String classID,
      String teacherClassID,
      String studentID,
      String studentName) async {
    final addStudentDetail = AddStudentModel(
      docid: studentID,
      studentName: studentName,
      classID: teacherClassID,
      createDate: DateTime.now().toString(),
    );
    await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection(batchId)
        .doc(batchId)
        .collection('classes')
        .doc(teacherClassID)
        .collection('Students')
        .doc(studentID)
        .set(addStudentDetail.toMap())
        .then((value) async {
      showToast(msg: "Added");
    });
  }
}
