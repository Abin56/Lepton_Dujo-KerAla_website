import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/model/teacher/teacher_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

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
          .add(teacherModel.toMap())
          .then((value) {
        firebaseFirestore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection('TempTeacherList')
            .doc(value.id)
            .update({"docid": value.id}).then(
          (value) {
            showToast(msg: "Successfully Created");
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

//add excel data to firebase create teacher

  Future<void> teacherExcelFunction() async {
    //extract excel data
    final result = await extractDataFromExcel();
    isLoading.value = true;
    if (result != null) {
      if (result.tables.isNotEmpty) {
        Sheet? table = result.tables[result.tables.keys.first];
        if (table != null) {
          for (int i = 1; i < table.maxRows; i++) {
            List<Data?>? firstRow = table.rows[i];
//fetching data from excel cells
            if (firstRow[0]?.value != null &&
                firstRow[1]?.value != null &&
                firstRow[2]?.value != null) {
              //creating objects and upload to firebase
              createNewTeacher(TeacherModel(
                teacherName: firstRow[0]?.value.toString(),
                employeeID: firstRow[1]?.value.toString(),
                createdAt: DateTime.now().toString(),
                teacherPhNo: firstRow[2]?.value.toString(),
                userRole: 'teacher',
              ));
            }
          }
          isLoading.value = false;
        } else {
          isLoading.value = false;
          showToast(msg: 'Empty Sheet');
        }
      }
    }
    isLoading.value = false;
  }

  void clearFields() {
    nameController.clear();
    phoneNumberController.clear();
    employeeIDController.clear();
  }
}
