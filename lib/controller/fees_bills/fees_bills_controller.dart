import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/class_model/class_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../model/create_classModel/add_student_model.dart';

class FeesBillsController {
  RxBool categoryCreateloading = RxBool(false);
  RxBool categoryFetchloading = RxBool(false);
  final DocumentReference<Map<String, dynamic>> fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);
  final Uuid uuid = const Uuid();

  String categoryCreateValue = "";
  String selectedPeriod = "";
  RxString selectedType = RxString("");
  RxList<String> selectDateList = RxList([]);
  List<ClassModel> allClass = [];
  List<AddStudentModel> allClassStudents = [];
  TextEditingController categoryNameController = TextEditingController();

  final List<String> selectionList = [
    'Monthly',
    'Quarterly',
    'Halfly',
    'Annually',
  ];

  List<String> monthly = <String>[
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<String> quarterly = <String>[
    "Jan-Mar",
    "Apr-Jun",
    "Jul-Sep",
    "Oct-Dec",
  ];
  List<String> halfYearly = <String>[
    "Jan-Jun",
    "Jul-Dec",
  ];

  //fetch all classes

  // Future<void> getAllClasses() async {
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> data =
  //         await fStore.collection("classes").get();
  //     allClass = data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
  //   } catch (e) {
  //     log(e.toString());
  //     showToast(msg: "Something Went Wrong");
  //   }
  // }

//get all students from class
  // Future<void> getAllStudentsFromClass() async {
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> data = await fStore
  //         .collection("classes")
  //         .doc(classId)
  //         .collection("Students")
  //         .get();
  //     allClassStudents =
  //         data.docs.map((e) => AddStudentModel.fromMap(e.data())).toList();
  //   } catch (e) {
  //     log(e.toString());
  //     showToast(msg: "Something Went Wrong");
  //   }
  // }

  //create category
  Future<void> createFeesCategory(
    String categoryName,
    String categoryType,
    BuildContext context,
  ) async {
    try {
      if (categoryCreateValue.isEmpty) {
        return showToast(msg: "Please select category");
      }
      categoryCreateloading.value = true;
      //checking category exist or not
      final datas = await fStore
          .collection("Fees")
          .where("categoryName", isEqualTo: categoryName)
          .get();
      if (datas.docs.isNotEmpty) {
        categoryCreateloading.value = false;
        return showToast(msg: "Failed Category already exists");
      }
//creating new category
      final String uid = "$categoryName${uuid.v1()}";
      fStore.collection("Fees").doc(uid).set(
        {
          "categoryName": categoryName,
          "type": categoryType,
          "id": uid,
        },
      ).then((value) {
        showToast(msg: "Successfully Created");
        categoryCreateValue = "";
        categoryNameController.clear();
        Navigator.pop(context);
      });

      categoryCreateloading.value = false;
    } catch (e) {
      categoryCreateloading.value = false;
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategoryList() async {
    try {
      categoryFetchloading.value = true;

      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("Fees").get();
      categoryFetchloading.value = false;
      return data.docs.map((e) => e.data()).toList();
    } catch (e) {
      showToast(msg: "Something went wrong");
      categoryFetchloading.value = false;
      return [];
    }
  }
}
