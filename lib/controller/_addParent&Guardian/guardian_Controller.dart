// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/parent&guardian/parent_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/parent&guardian/guardian_model.dart';
import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';

class GuardianController extends GetxController {
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
        docid: uuid.v1());
    firebaseFirestore
        .collection("classes")
        .doc(classID)
        .collection('Temp_GuardianCollection')
        .doc(data.docid)
        .set(data.toMap())
        .then((value) {
          guardianName.clear();
          guardianPhoneNumber.clear();
      
      showToast(msg: "Added");
    });
  }
}
