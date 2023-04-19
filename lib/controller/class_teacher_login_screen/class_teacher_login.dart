// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/web/login/class_teacher/classteacher_dash_board/teachers_panel_screen.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class ClassTeacherLoginController extends GetxController {
  
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  CollectionReference collectioRef = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection("Teachers");

  Future<void> classTeacherLogin(BuildContext context) async {
    //>>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    Query query =
        collectioRef.where("teacherEmail", isEqualTo: idController.text.trim());
    QuerySnapshot querySnapshot = await query.get();
    final docData = querySnapshot.docs.map((doc) => doc.data()).toList();

    Query queries = collectioRef.where("employeeID",
        isEqualTo: passwordController.text.trim());
    QuerySnapshot querySnapshott = await queries.get();
    final docDataa = querySnapshott.docs.map((doc) => doc.data()).toList();
    log(query.toString());
    log(docDataa.toString());

    if (docDataa.isNotEmpty && docData.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          TeacherLoginIDSaver.id = idController.text.trim();
          return ClassTeacherAdmin(
            schoolID: Get.find<AdminLoginScreenController>().schoolID,
            teacherID: idController.text.trim(),
            teacherEmail: idController.text.trim(),
          );
        },
      ));
      log('Correct password');
    } else {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Message'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[Text('Wrong Password')],
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

 Future<QuerySnapshot<Map<String, dynamic>>> checkSampoorna(String classID, String studentID) async {
    Future<QuerySnapshot<Map<String, dynamic>>> docs = 
     FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("Classes")
        .doc(classID)
        .collection("Students")
        .doc(studentID)
        .collection("sampoorna")
        .get();
        return docs;
  }
  
  
}
