import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/class_model/class_model.dart';
import '../../model/create_classModel/add_student_model.dart';
import '../../model/fees_bills_model/fees_model.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesClassController {
  List<ClassModel> allClass = [];
  List<AddStudentModel> allClassStudents = [];
  RxBool categoryFetchloading = RxBool(false);
  final DocumentReference<Map<String, dynamic>> _fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  Future<List<ClassModel>> getAllClasses() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await _fStore.collection("classes").get();
      allClass = data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      return allClass;
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategoryList(
      {required String classId}) async {
    try {
      categoryFetchloading.value = true;

      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classId)
          .collection("ClassFees")
          .get();
      categoryFetchloading.value = false;
      return data.docs.map((e) => e.data()).toList();
    } catch (e) {
      showToast(msg: "Something went wrong");
      categoryFetchloading.value = false;
      return [];
    }
  }

  Future<FeesModel?> getFeesCategoryData(
      String feesCategoryId, String classId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classId)
          .collection("ClassFees")
          .get();
      final QueryDocumentSnapshot<Map<String, dynamic>> result =
          data.docs.firstWhere((element) => element.id == feesCategoryId);

      final datas = FeesModel.fromMap(result.data());

      return datas;
    } on FirebaseException catch (e) {
      showToast(msg: e.code);
      log(e.toString());
      return null;
    }
  }

  //get all students from class
  Future<List<AddStudentModel>> getAllStudentsFromClass(String classId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("classes")
          .doc(classId)
          .collection("Students")
          .get();
      allClassStudents =
          data.docs.map((e) => AddStudentModel.fromMap(e.data())).toList();

      allClassStudents.sort((a, b) => a.studentName!
          .toLowerCase()
          .compareTo(b.studentName?.toLowerCase() ?? ""));
      return allClassStudents;
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  Future<void> addStudentToFeePaid({
    required String categoryId,
    required String classId,
    required String studentId,
  }) async {
    await _fStore
        .collection("classes")
        .doc(classId)
        .collection("ClassFees")
        .doc(categoryId)
        .update({
      "studentList": FieldValue.arrayUnion([
        {
          "collectedAmount": "",
          "studentId": studentId,
          "totalAmount": "",
        }
      ])
    }).catchError((error) => showToast(msg: (error as FirebaseException).code));
  }

  Future<void> removeStudentToFeePaid({
    required String categoryId,
    required String classId,
    required String studentId,
  }) async {
    await _fStore
        .collection("classes")
        .doc(classId)
        .collection("ClassFees")
        .doc(categoryId)
        .update({
      "studentList": FieldValue.arrayRemove([
        {
          "collectedAmount": "",
          "studentId": studentId,
          "totalAmount": "",
        }
      ])
    }).catchError((error) => showToast(msg: (error as FirebaseException).code));
  }
}