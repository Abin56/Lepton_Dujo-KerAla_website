import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dujo_kerala_website/model/teacher/teacher_model.dart';

class TeacherController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController employeeIDController = TextEditingController();
  RxBool isLoading = RxBool(false);

  ///creating a temporary teacher collection. It will be shows in main collection only whenever teacher signup on mobile device.
  Future<void> createNewTeacher(TeacherModel teacherModel) async {
    try {
      isLoading.value = true;
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
            .update({"docid": value.id}).then(
          (value) {
            showToast(msg: "Scuccessfully Created");
            clearFields();
          },
        );
      });
      isLoading.value = false;
    } catch (e) {
      showToast(msg: "Teacher Creation Failed");
      isLoading.value = false;
    }
  }

  void clearFields() {
    nameController.clear();
    phoneNumberController.clear();
    employeeIDController.clear();
  }
}
