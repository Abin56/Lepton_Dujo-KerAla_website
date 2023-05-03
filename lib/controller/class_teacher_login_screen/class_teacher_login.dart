// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/web/login/class_teacher/classteacher_dash_board/teachers_panel_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class ClassTeacherLoginController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection("Teachers");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = RxBool(false);

  //class Teacher Login

  Future<void> classTeacherLogin(BuildContext context) async {
    try {
      isLoading.value = true;
      firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
//fetching user collection from firebase firestore
        final DocumentSnapshot<Map<String, dynamic>> result =
            await firebaseFirestore.doc(value.user?.uid).get();
//Checking if it is class teacher or not

        if (result.data()?["userRole"] == "classTeacher") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ClassTeacherAdmin(
                  schoolID: Get.find<AdminLoginScreenController>().schoolID,
                  teacherID: value.user?.uid ?? "",
                  teacherEmail: value.user?.email ?? ""),
            ),
          );
        } else {
          await firebaseAuth.signOut();
          showToast(msg: "You are not a Class Teacher");
        }

        emailController.clear();
        passwordController.clear();
      });
      isLoading.value = false;
    } catch (e) {
      showToast(msg: "Login Failed");
      isLoading.value = false;
    }
  }
}
