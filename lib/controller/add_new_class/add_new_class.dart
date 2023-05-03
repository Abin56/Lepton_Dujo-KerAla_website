import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/add_class/add_new_class.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/get_allTeachers.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AddSchoolClassController extends GetxController {
  final GlobalKey<FormState> updateFormkey = GlobalKey<FormState>();
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid']);

  addNewClassFunction(TextEditingController className) {
    final data = SchoolClassesModel(
        classTeacherName: '',
        classTeacherdocid: '',
        docid: className.text.trim() + uuid.v1(),
        className: className.text.trim());
    firebaseFirestore.collection("classes").doc(data.docid).set(data.toMap());
  }

  setClassForbatchYear(String className, String docid) {
    final data = SchoolClassesModel(docid: docid, className: className);
    firebaseFirestore
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(docid)
        .set(data.toMap());
  }

  updateClassName(String docid, BuildContext context, String hintText) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        TextEditingController editingController = TextEditingController();
        return Form(
          key: updateFormkey,
          child: AlertDialog(
            title: const Text('Update Detail'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: hintText),
                    controller: editingController,
                    validator: (value) {
                      if (editingController.text.trim().isEmpty) {
                        return 'Invalid!!';
                      } else {
                        return null;
                      }
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ok'),
                onPressed: () async {
                  if (updateFormkey.currentState!.validate()) {
                    firebaseFirestore.collection("classes").doc(docid).update({
                      'className': editingController.text.trim()
                    }).then((value) {
                      firebaseFirestore
                          .collection(Get.find<GetFireBaseData>().bYear.value)
                          .doc(Get.find<GetFireBaseData>().bYear.value)
                          .collection('classes')
                          .doc(docid)
                          .update({
                        'className': editingController.text.trim()
                      }).then((value) => Navigator.of(context).pop());
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  deleteClass(String docid, BuildContext context) async {
    if (schoolListValue!['docid'] == FirebaseAuth.instance.currentUser!.uid) {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Once you delete a class all data will be lost \n Are you sure ?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ok'),
                onPressed: () async {
                  firebaseFirestore
                      .collection("classes")
                      .doc(docid)
                      .delete()
                      .then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Sorry you have no access to delete')
                ],
              ),
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

  setclassIncharge(String docid, BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set Class Incharge'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GetAllTeachersListDropDownButton(
                    schoolID: schoolListValue!['docid']),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                firebaseFirestore
                    .collection(Get.find<GetFireBaseData>().bYear.value)
                    .doc(Get.find<GetFireBaseData>().bYear.value)
                    .collection('classes')
                    .doc(docid)
                    .update({
                  'classTeacherdocid': allTeachersListValue!['docid'],
                  'classTeacherName': allTeachersListValue!['teacherName'],
                }).then((value) {
                  firebaseFirestore
                      .collection('Teachers')
                      .doc(allTeachersListValue!['docid'])
                      .update({'userRole': 'classTeacher'});
                }).then((value) => Navigator.pop(context));
              },
            ),
          ],
        );
      },
    );
  }

  deleteBatchClasses(BuildContext context, String docid) async {
    if (schoolListValue!['docid'] == FirebaseAuth.instance.currentUser!.uid) {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Once you delete a class all data will be lost \n Are you sure ?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ok'),
                onPressed: () async {
                  firebaseFirestore
                      .collection(Get.find<GetFireBaseData>().bYear.value)
                      .doc(Get.find<GetFireBaseData>().bYear.value)
                      .collection('classes')
                      .doc(docid)
                      .delete()
                      .then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Sorry you have no access to delete')
                ],
              ),
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
}
