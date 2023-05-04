import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/class_teacher/add_subject/add_subjects.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class SubjectController extends GetxController {
  final GlobalKey<FormState> updateFormkey = GlobalKey<FormState>();
  RxString classIDD = ''.obs;
  RxString className = ''.obs;
  RxString classTeacherdocid = ''.obs;
  RxString classTeacherName = ''.obs;
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid']);

  ///
  addSubjectInClassWise(
    TextEditingController subjectName,
  ) async {
    SubjectModel data = SubjectModel(
        subjectName: subjectName.text.trim(),
        docid: subjectName.text.trim() + uuid.v1());

    firebaseFirestore
        .collection("classes")
        .doc(Get.find<GetFireBaseData>().getTeacherClassRole.value)
        .collection("subjects")
        .doc(subjectName.text.trim() + uuid.v1())
        .set(data.toMap())
        .then((value) {
      showToast(msg: 'Added');
      subjectName.clear();
    });
  }

  editClassName(BuildContext context, String helperText, String docid) async {
    TextEditingController updateController = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: updateFormkey,
          child: AlertDialog(
            title: const Text('Update'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (updateController.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: updateController,
                    decoration: InputDecoration(hintText: helperText),
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
                    firebaseFirestore
                        .collection("classes")
                        .doc(Get.find<GetFireBaseData>()
                            .getTeacherClassRole
                            .value)
                        .collection("subjects")
                        .doc(docid)
                        .update({
                      'subjectName': updateController.text.trim()
                    }).then((value) {
                      showToast(msg: 'Changed');
                      Navigator.of(context).pop();
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

  Future<void> getClass(
    String teacherdocid,
  ) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .where('classTeacherdocid', isEqualTo: teacherdocid)
        .get();

    className.value = vari.docs[0]['className'];
    classTeacherName.value = vari.docs[0]['classTeacherName'];
    classTeacherdocid.value = vari.docs[0]['classTeacherdocid'];

    classIDD.value = vari.docs[0]['docid'];
    // classIDD.value = vari.data()!['docid'];
    // classTeacherdocid.value = vari.data()!['classTeacherdocid'];
    // classTeacherName.value = vari.data()!['classTeacherName'];
  }
}
