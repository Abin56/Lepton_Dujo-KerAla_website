import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:get/get.dart';

import '../../model/create_classModel/add_student_model.dart';
import '../../model/fees_bills_model/fees_model.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesSchoolController {
  static String className = "FeesSchoolController";
  Map<String, dynamic> selectedClass = {};
  Rxn<FeesModel> selectedFeesModel = Rxn<FeesModel>();
  List<AddStudentModel> allClassStudents = [];
  RxBool isLoading = RxBool(false);

  final _fStore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value)
      .collection("Fees");

  Future<List<Map<String, dynamic>>> fetchClassName() async {
    try {
      final data = await _fStore.doc("Fees").collection("SchoolFees").get();
      return data.docs.map((e) => e.data()).toList();
    } catch (e) {
      log(e.toString(), name: "$className+fetchClassName");
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  Future<List<FeesModel>> fetchAllFees({required String selectedClass}) async {
    try {
      if (selectedClass.isEmpty) {
        return [];
      }
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .doc("Fees")
          .collection("SchoolFees")
          .doc(selectedClass)
          .collection("AllFees")
          .get();
      return data.docs.map((e) => FeesModel.fromMap(e.data())).toList();
    } catch (e) {
      log(e.toString(), name: "$className+fetchAllFees");
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  Future<List<AddStudentModel>> fetcAllStudentsFromClass(
      {required String classId}) async {
    if (classId.isEmpty) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> allStudents =
          await FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection("classes")
              .doc(classId)
              .collection("Students")
              .get();

      return allStudents.docs
          .map((e) => AddStudentModel.fromMap(e.data()))
          .toList();
    } catch (e) {
      log(e.toString(), name: "$className-fetcAllStudentsFromClass");
      return [];
    }
  }

  Future<void> submit() async {
    try {
      isLoading.value = true;
      await _fStore
          .doc("Fees")
          .collection("SchoolFees")
          .doc(selectedClass["id"])
          .collection("AllFees")
          .doc(selectedFeesModel.value?.feesId)
          .update({
        "studentList": selectedFeesModel.value?.studentList ?? []
      }).then((value) async {
        final result = await _fStore
            .doc("Fees")
            .collection("SchoolFees")
            .doc(selectedClass["id"])
            .collection("AllFees")
            .doc(selectedFeesModel.value?.feesId)
            .get();
        if (result.data() != null) {
          selectedFeesModel.value = FeesModel.fromMap(result.data()!);
          selectedFeesModel.refresh();
        }
        showToast(msg: "Successfully Updated");
      });
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString(), name: "$className+submit");
      showToast(msg: "Something went wrong");
    }
  }
}
