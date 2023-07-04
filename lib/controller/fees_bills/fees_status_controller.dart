import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/class_model/class_model.dart';
import '../../model/create_classModel/add_student_model.dart';
import '../../model/fees_bills_model/fees_model.dart';
import '../../model/fees_bills_model/fees_subcategory_model.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesStatusController {
  String selectedMainCategory = "";
  String selectedSubCategory = "";
  String selectedClass = "";
  List<AddStudentModel> allClassStudents = [];
  String categoryData = "";
  final DocumentReference<Map<String, dynamic>> _fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

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

//fetch all creted category list from database
  Future<List<Map<String, dynamic>>> fetchAllSchoolCategories() async {
    final QuerySnapshot<Map<String, dynamic>> categoryList =
        await _fStore.collection("Fees").get();
    return categoryList.docs.map((e) => e.data()).toList();
  }

  //fetch all subcategory
  Future<List<FeesSubCategoryModel>> fetchAllSchoolSubCategories(
      String categoryId) async {
    if (selectedMainCategory.isEmpty) {
      return [];
    }
    final QuerySnapshot<Map<String, dynamic>> categoryList = await _fStore
        .collection("Fees")
        .doc(categoryId)
        .collection("SubCategory")
        .orderBy("createdAt")
        .get();
    return categoryList.docs
        .map((e) => FeesSubCategoryModel.fromMap(e.data()))
        .toList();
  }

  Future<List<ClassModel>> getAllClasses() async {
    if (selectedSubCategory.isEmpty) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await _fStore.collection("classes").get();
      return data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  Future<FeesModel?> getFeesCategoryData({
    required String feesCategoryId,
    required String classId,
    required String subCategoryId,
  }) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fStore
          .collection("Fees")
          .doc(feesCategoryId)
          .collection("SubCategory")
          .doc(subCategoryId)
          .collection("Classes")
          .get();

      final QueryDocumentSnapshot<Map<String, dynamic>> result =
          data.docs.firstWhere((element) => element.id == classId);

      final FeesModel datas = FeesModel.fromMap(result.data());

      return datas;
    } on FirebaseException catch (e) {
      showToast(msg: e.code);
      log(e.toString());
      return null;
    }
  }

  Future<void> addStudentToFeePaid({
    required String categoryId,
    required String subCategoryId,
    required String classId,
    required String studentId,
  }) async {
    await _fStore
        .collection("Fees")
        .doc(categoryId)
        .collection("SubCategory")
        .doc(subCategoryId)
        .collection("Classes")
        .doc(classId)
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
    required String subCategoryId,
    required String classId,
    required String studentId,
  }) async {
    await _fStore
        .collection("Fees")
        .doc(categoryId)
        .collection("SubCategory")
        .doc(subCategoryId)
        .collection("Classes")
        .doc(classId)
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
