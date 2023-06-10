import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/create_classModel/add_student_model.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';
import '../../../get_firebase-data/get_firebase_data.dart';

class TeacherAddStudentController extends GetxController {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController parentPhNoController = TextEditingController();
  TextEditingController addmissionNumberController = TextEditingController();
  RxBool isLoading = RxBool(false);

  DocumentReference<Map<String, dynamic>> firebaseFirestore = FirebaseFirestore
      .instance
      .collection('SchoolListCollection')
      .doc(Get.find<AdminLoginScreenController>().schoolID);

  Future<void> createStudent({required studentModel}) async {
    try {
      isLoading.value = true;
    
      await firebaseFirestore
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("classes")
          .doc(Get.find<GetFireBaseData>().classIDD.value)
          .collection('TempStudents')
          .add(studentModel.toMap())
          .then((value) async {
        await firebaseFirestore
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
            .doc(Get.find<GetFireBaseData>().classIDD.value)
            .collection('TempStudents')
            .doc(value.id)
            .update({"docid": value.id});
        studentNameController.clear();
        parentPhNoController.clear();
        addmissionNumberController.clear();
      });

      showToast(msg: "Successfully Created");
      isLoading.value = false;
    } catch (e) {
      showToast(msg: 'Student Creation Failed');
      isLoading.value = false;
    }
  }
    Future<void> admincreateStudent({required studentModel ,required classID}) async {
    try {
      isLoading.value = true;
    
      await firebaseFirestore
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("classes")
          .doc(classID)
          .collection('TempStudents')
          .add(studentModel.toMap())
          .then((value) async {
        await firebaseFirestore
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
            .doc(classID)
            .collection('TempStudents')
            .doc(value.id)
            .update({"docid": value.id});
        studentNameController.clear();
        parentPhNoController.clear();
        addmissionNumberController.clear();
      });

      showToast(msg: "Successfully Created");
      isLoading.value = false;
    } catch (e) {
      showToast(msg: 'Student Creation Failed');
      isLoading.value = false;
    }
  }
}
