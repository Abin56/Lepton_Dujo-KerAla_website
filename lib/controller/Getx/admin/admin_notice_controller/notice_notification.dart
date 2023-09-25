import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';
import '../../../get_firebase-data/get_firebase_data.dart';

class AdminNoticeNotification {
  CollectionReference collectionRef = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(AdminLoginScreenController().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value)
      .collection('classes');
  List<String> deviceTokenList = [];
  List<String> parentsTokenList = [];
  List<String> guardiansTokenList = [];
  List<String> studentsTokenList = [];

  Future<void> sendNoticeNotification() async {
    await parentsNotification();
    await guardiansNotification();
    await teacherNotification();
    await studentsNotification();
  }

  Future<void> parentsNotification() async {
    QuerySnapshot snapshot = await collectionRef.get();
    for (DocumentSnapshot document in snapshot.docs) {
      DocumentReference docref = document.reference;
      CollectionReference pref = docref.collection('ParentCollection');
      QuerySnapshot snap2 = await pref.get();
      for (DocumentSnapshot doc in snap2.docs) {
        final docData = doc.data() as Map<String, dynamic>;
        if (docData['deviceToken'] != null) {
          parentsTokenList.add(docData['deviceToken']);
        }
      }
    }

    for (var i = 0; i < parentsTokenList.length; i++) {
      sendPushMessage(
          parentsTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }

  Future<void> guardiansNotification() async {
    QuerySnapshot snapshot = await collectionRef.get();

    for (DocumentSnapshot document in snapshot.docs) {
      DocumentReference docref = document.reference;
      CollectionReference pref = docref.collection('GuardianCollection');
      QuerySnapshot snap2 = await pref.get();
      for (DocumentSnapshot doc in snap2.docs) {
        final docData = doc.data() as Map<String, dynamic>;
        if (docData['deviceToken'] != null) {
          guardiansTokenList.add(docData['deviceToken']);
        }
      }
    }

    for (var i = 0; i < guardiansTokenList.length; i++) {
      sendPushMessage(
          guardiansTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }

  Future<void> teacherNotification() async {
    final collectionRef = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(AdminLoginScreenController().schoolID)
        .collection('Teachers')
        .get();
    for (DocumentSnapshot doc in collectionRef.docs) {
      final docData = doc.data() as Map<String, dynamic>;
      if (docData['deviceToken'] != null) {
        studentsTokenList.add(docData['deviceToken']);
      }
    }
    for (var i = 0; i < deviceTokenList.length; i++) {
      sendPushMessage(
          deviceTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }

  Future<void> studentsNotification() async {
    final collectionRef = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(AdminLoginScreenController().schoolID)
        .collection('AllStudents')
        .get();
    for (DocumentSnapshot doc in collectionRef.docs) {
      final docData = doc.data() as Map<String, dynamic>;
      if (docData['deviceToken'] != null) {
        studentsTokenList.add(docData['deviceToken']);
        log(docData['deviceToken'] + ' ' + docData['studentName']);
      }
    }
    for (var i = 0; i < studentsTokenList.length; i++) {
      sendPushMessage(
          studentsTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }
}
