import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MultipleStudentsController extends GetxController {
  RxBool isLoading = RxBool(false);
  assignStudentToParent(String schoolID, String batchID, String classID,
      String parentID, String studentID, String? stundetName) async {
    log('School ID :: $schoolID');
    log('Batch ID :: $batchID');
    log('Class ID :: $classID');
    log('Parent ID :: $parentID');
    log('Student ID :: $studentID');
    isLoading.value = true;
    final firebase = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolID)
        .collection(batchID)
        .doc(batchID)
        .collection('classes')
        .doc(classID);

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
      }, SetOptions(merge: true)).then((value) async {
        await firebase
            .collection("ParentCollection")
            .doc(parentID)
            .collection('MultipleStudents')
            .doc(studentID)
            //ad
            .set({
          'studentID': studentID,
          'studentName': stundetName ?? 'Name not found'
        }).then((value) async {
          await firebase
              .collection('Students')
              .doc(studentID)
              .set({"parentID": parentID}, SetOptions(merge: true));
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
          .set({'studentID': studentID, 'studentName': stundetName},
              SetOptions(merge: true));
      isLoading.value = false;
    }
  }
}
