import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/model/teacher/add_teacher_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController emailIDController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController employeeID = TextEditingController();
  TeacherController teacherController = Get.put(TeacherController());

  ///creating a temporary teacher collection. It will be shows in main collection only whenever teacher signup on mobile device.
  Future<void> createNewTeacher(AddTeachersModel teacherModel) async {
    try {
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('TempTeacherList')
          .add(teacherModel.toJson())
          .then((value) {
        firebaseFirestore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection('TempTeacherList')
            .doc(value.id)
            .update({"docid": value.id});
      });
    } catch (e) {
      showToast(msg: "Teacher Creation Failed");
    }
  }
}
