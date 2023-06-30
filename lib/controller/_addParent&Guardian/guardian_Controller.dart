// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/create_classModel/add_student_model.dart';
import '../../model/parent&guardian/guardian_model.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../get_firebase-data/get_firebase_data.dart';

class GuardianController extends GetxController {
  RxBool isLoading = RxBool(false);
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid']);

  addGuardian(
      TextEditingController guardianName,
      TextEditingController guardianPhoneNumber,
      String studentDocID,
      String classID) async {
    GuardianModel data = GuardianModel(
        guardianName: guardianName.text.trim(),
        guardianPhoneNumber: guardianPhoneNumber.text.trim(),
        studentID: studentDocID,
        createdate: DateTime.now().toString(),
        docid: uuid.v1());
    isLoading.value = true;
    await firebaseFirestore
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .doc(classID)
        .collection('Temp_GuardianCollection')
        .doc(data.docid)
        .set(data.toMap())
        .then((value) {
      guardianName.clear();
      guardianPhoneNumber.clear();

      showToast(msg: "Added");
    }).then((value) async {
      await firebaseFirestore
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("classes")
          .doc(classID)
          .collection("Students")
          .doc(studentDocID)
          .update({"guardianID": " "});
      await getAllStudent(classID);
    });
    isLoading.value = false;
  }

  Future<List<AddStudentModel>> getAllStudent(String classID) async {
    final studentData = await firebaseFirestore
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .doc(classID)
        .collection("Students")
        .orderBy('studentName', descending: false)
        .get();

    final List<AddStudentModel> studentListData = studentData.docs
        .map(
          (e) => AddStudentModel.fromMap(
            e.data(),
          ),
        )
        .toList();

    return studentListData.where((e) => e.guardianID!.isEmpty).toList();
  }
}
