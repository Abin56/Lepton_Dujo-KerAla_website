import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/web/widgets/drop_DownList/schoolDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/constant/constant.dart';
import '../get_firebase-data/get_firebase_data.dart';

class MultipleStudentsController extends GetxController {
  RxBool isLoading = RxBool(false);
  assignStudentToParent(
      String schoolID,
      String batchID,
      String classID,
      String parentID,
      String studentID,
      String? stundetName,
      String parentClassID,
      BuildContext context) async {
    log('School ID :: $schoolID');
    log('Batch ID :: $batchID');
    log('Class ID :: $classID');
    log('Parent ID :: $parentID');
    log('Student ID :: $studentID');
    log('Parent class  ID :: $parentClassID');
    isLoading.value = true;
    final firebase = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolID)
        .collection(batchID)
        .doc(batchID)
        .collection('classes')
        .doc(parentClassID);

    final checkingstudentID =
        await firebase.collection('ParentCollection').doc(parentID).get();

    if (checkingstudentID.data()?['studentID'] != null) {
      log("Current StudentID ::: ${checkingstudentID.data()?['studentID']}");

      final currentStundetNAme = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(schoolID)
          .collection('AllStudents')
          .doc(checkingstudentID.data()!['studentID'])
          .get();

      await firebase
          .collection("ParentCollection")
          .doc(parentID)
          .collection('MultipleStudents')
          .doc(checkingstudentID.data()!['studentID'])
          .set({
        'studentID': checkingstudentID.data()!['studentID'],
        'studentName': currentStundetNAme.data()?['studentName'],
        'classID': currentStundetNAme.data()?['classID'],
        'schoolID': schoolListValue!['docid'],
        'batchID': Get.find<GetFireBaseData>().bYear.value,
      }, SetOptions(merge: true)).then((value) async {
        await firebase
            .collection("ParentCollection")
            .doc(parentID)
            .collection('MultipleStudents')
            .doc(studentID)
            .set({
          'studentID': studentID,
          'studentName': stundetName ?? 'Name not found',
          'classID': classID,
          'schoolID': schoolListValue!['docid'],
          'batchID': Get.find<GetFireBaseData>().bYear.value,
        }).then((value) async {
          await FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(schoolID)
              .collection(batchID)
              .doc(batchID)
              .collection('classes')
              .doc(classID)
              .collection('Students')
              .doc(studentID)
              .set({"parentID": parentID}, SetOptions(merge: true)).then(
                  (value) async {
            await FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(schoolID)
                .collection('AllStudents')
                .doc(studentID)
                .set({"parentID": parentID});
          });
        }).then((value) {
          Navigator.pop(context);
          return showToast(msg: 'Added Successfully');
        });
      });
      isLoading.value = false;
    } else {
      log("Current StudentID ::: NOT FOUND ::");
      await firebase
          .collection("ParentCollection")
          .doc(parentID)
          .collection('MultipleStudents')
          .doc(studentID)
          .set({
        'studentID': studentID,
        'studentName': stundetName,
        'classID': classID,
        'schoolID': schoolListValue!['docid'],
        'batchID': Get.find<GetFireBaseData>().bYear.value,
      }, SetOptions(merge: true)).then((value) {
        Navigator.pop(context);
        return showToast(msg: 'Added Successfully');
      });
      isLoading.value = false;
    }
  }
}
