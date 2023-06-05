import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/create_classModel/add_student_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:get/get.dart';

import '../../../../model/class_model/class_model.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';

class ShiftClassController {
  static String name = "ShiftClassController";
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  RxnString oldClassId = RxnString();
  RxnString newClassId = RxnString();
  RxnString batchId = RxnString();
  List<ClassModel> newClassesList = [];
  RxList<AddStudentModel> addStudentstoNewClassList = RxList([]);
  RxBool isLoading = RxBool(false);
  RxBool isLoadingSubmit = RxBool(false);

  //fetching current class data
  Future<List<ClassModel>> fetchOldClass() async {
    try {
      isLoading.value = true;
      final QuerySnapshot<Map<String, dynamic>> result = await fireStore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .get();

      List<ClassModel> oldClassesList =
          result.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      isLoading.value = false;
      return oldClassesList;
    } catch (e) {
      isLoading.value = false;
      log(e.toString(), name: name);
      showToast(msg: "Something went wrong");
      return [];
    }
  }

//todo :add a condition dont need to fetch current batch id
//fetch batch year
  Future<List<String>> fetchBatchDetails() async {
    try {
      isLoading.value = true;
      final QuerySnapshot<Map<String, dynamic>> result = await fireStore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('BatchYear')
          .where('id', isNotEqualTo: Get.find<GetFireBaseData>().bYear.value)
          .get();

      List<String> batchDetails = result.docs.map((e) => e.id).toList();

      isLoading.value = false;
      return batchDetails;
    } catch (e) {
      log(e.toString(), name: name);
      isLoading.value = false;
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  //fetch batch year classes

  Future<void> fetchNewClasses() async {
    try {
      isLoading.value = true;
      if (batchId.value != null) {
        final QuerySnapshot<Map<String, dynamic>> result = await fireStore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(batchId.value!)
            .doc(batchId.value!)
            .collection('classes')
            .get();
        newClassesList =
            result.docs.map((e) => ClassModel.fromMap(e.data())).toList();
        isLoading.value = false;
      }
    } catch (e) {
      log(e.toString(), name: name);
      isLoading.value = false;
      showToast(msg: "Something went wrong");
    }
  }

  Future<List<AddStudentModel>> getAllStudents() async {
    if (oldClassId.value == null) {
      return [];
    }
    try {
      isLoading.value = true;
      final QuerySnapshot<Map<String, dynamic>> result = await fireStore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(oldClassId.value)
          .collection('Students')
          .get();

      List<AddStudentModel> studentList =
          result.docs.map((e) => AddStudentModel.fromMap(e.data())).toList();
      isLoading.value = false;
      studentList
          .sort((a, b) => (a.studentName ?? "").compareTo(b.studentName ?? ""));
      return studentList;
    } catch (e) {
      isLoading.value = false;
      log(e.toString(), name: name);
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  Future<void> addSelectedStudentsToNewBatch() async {
    try {
      if (addStudentstoNewClassList.isNotEmpty) {
        isLoadingSubmit.value = true;
        final CollectionReference<Map<String, dynamic>> firebasePath = fireStore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection(batchId.value ?? "")
            .doc(batchId.value)
            .collection('classes')
            .doc(newClassId.value)
            .collection('Students');

        for (var element in addStudentstoNewClassList) {
          firebasePath.doc(element.docid).set(element.toMap()).then((value) {
            //updating AllStudent Data classId
            fireStore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID).collection('AllStudents').doc(element.docid).update({"classID":newClassId.value});
          });
        }
        isLoadingSubmit.value = false;
        showToast(msg: "Successfully Shifted");
      }
    } catch (e) {
      isLoadingSubmit.value = false;
      log(e.toString(), name: name);
      showToast(msg: "Something went wrong");
    }
  }

  void clearData() {
    oldClassId.value = null;
    newClassId.value = null;
    batchId.value = null;
    newClassesList = [];
    addStudentstoNewClassList.value = [];
  }
}
