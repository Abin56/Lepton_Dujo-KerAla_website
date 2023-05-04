import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/class_teacher/add_subject/add_subjects.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class SubjectController extends GetxController {
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
