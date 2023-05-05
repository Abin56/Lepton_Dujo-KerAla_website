// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/parent&guardian/parent_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';

class ParentController extends GetxController {
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid']);

  addParent(
      TextEditingController parentName,
      TextEditingController parentPhoneNumber,
      String studentDocID,
      String classID) async {
    ParentModel data = ParentModel(
        parentName: parentName.text.trim(),
        parentPhoneNumber: parentPhoneNumber.text.trim(),
        studentID: studentDocID,
        createdate: DateTime.now().toString(),
        docid: uuid.v1());
    firebaseFirestore
        .collection("classes")
        .doc(classID)
        .collection('Temp_ParentCollection')
        .doc(data.docid)
        .set(data.toMap())
        .then((value) {
          parentName.clear();
          parentPhoneNumber.clear();
      
      showToast(msg: "Added");
    });
  }
}
