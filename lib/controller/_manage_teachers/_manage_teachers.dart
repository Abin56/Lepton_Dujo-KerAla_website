import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/class_teacher/add_subject/add_subjects.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../get_firebase-data/get_firebase_data.dart';

class ManageTeachersController extends GetxController {
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid']);

  ///////////////////
  addteachersToClass(String teacherdocID, String teacherName) async {
    firebaseFirestore
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
        .collection('teachers')
        .doc(teacherdocID)
        .set({
      'docid': teacherdocID,
      'teacherName': teacherName,
    }).then((value) {
      showToast(msg: "Added");
    });
  }

  addSubjectsToTeacher(BuildContext context,String teacherid) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Manage Subject'),
          content: Container(
            height: 400,
            width: 500,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('SchoolListCollection')
                    .doc(schoolListValue!['docid'])
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection('classes')
                    .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
                    .collection('subjects')
                    .snapshots(),
                builder: (context, snap) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40,
                          child: Row(
                            children: [
                              Text(snap.data?.docs[index]['subjectName']),
                              IconButton(
                                  onPressed: () async {
                                    firebaseFirestore
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
                                        .doc(teacherid)
                                        .collection('teacherSubject')
                                        .doc(snap.data!.docs[index]['docid'])
                                        .set({
                                          'docid':snap.data!.docs[index]['docid'],
                                          'subjectName':snap.data!.docs[index]['subjectName']
                                        }).then(
                                            (value) => showToast(msg: 'Added'));
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: snap.data!.docs.length);
                }),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
