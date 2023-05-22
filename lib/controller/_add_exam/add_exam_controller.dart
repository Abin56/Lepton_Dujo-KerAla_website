import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/add_exam_model/add_exam_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AddExamController extends GetxController {
  final firebase = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(schoolListValue!['docid'])
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  addExamtoSever(BuildContext context, String docid, String examName,
      String examLevel, String startingDate, endDate, publishDate) async {
    final docids = examLevel + uuid.v1();
    final details = AddExamModel(
        docid: docids,
        examName: examName,
        examLevel: examLevel,
        startingDate: startingDate,
        endDate: endDate,
        publishDate: publishDate);
    firebase
        .collection(examLevel)
        .doc(docids)
        .set(details.toMap())
        .then((value) {
      Navigator.pop(context);
      showToast(msg: 'Exam created');
    });
  }
}
