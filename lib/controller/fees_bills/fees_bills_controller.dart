import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/model/class_model/class_model.dart';
import 'package:dujo_kerala_website/model/fees_bills_model/fees_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../model/fees_bills_model/fees_category_model.dart';
import '../../model/fees_bills_model/fees_subcategory_model.dart';

class FeesBillsController extends GetxController {
  //category name dropdown selected category
  FeesCategoryModel? selectedMainCategory;
  //selected subcategory from
  FeesSubCategoryModel? selectedSubCategory;
  @override
  void onInit() async {
    await getAllClasses();
    super.onInit();
  }

  RxBool categoryFetchloading = RxBool(false);
  final DocumentReference<Map<String, dynamic>> fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  ///for unique id creation
  final Uuid uuid = const Uuid();

  TextEditingController amountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

//category create section variables

  ///category creation varibles
  RxString selectedType = RxString("");
  List<ClassModel> allClass = [];
  List<String> tokenList = [];
//this for add category only selected class if this value is true then selected school dropdown will show
  RxBool isSpecificClassOnly = RxBool(false);
  ClassModel? selectedClass;

  //fetch all classes

  Future<List<ClassModel>> getAllClasses() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("classes").get();
      allClass = data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      return allClass;
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
      return [];
    }
  }

  //fetch category list

  Future<List<FeesCategoryModel>> fetchCategoryList() async {
    try {
      categoryFetchloading.value = true;

      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("Fees").get();
      categoryFetchloading.value = false;
      return data.docs.map((e) => FeesCategoryModel.fromMap(e.data())).toList();
    } catch (e) {
      showToast(msg: "Something went wrong");
      categoryFetchloading.value = false;
      return [];
    }
  }

  //fetch sub category list

  Future<List<FeesSubCategoryModel>> fetchSubCategoryList(
      String categoryId) async {
    log("<<<<<<<<<<<<<<<<<$categoryId");
    try {
      categoryFetchloading.value = true;

      final QuerySnapshot<Map<String, dynamic>> data = await fStore
          .collection("Fees")
          .doc(categoryId)
          .collection("SubCategory")
          .get();
      categoryFetchloading.value = false;
      return data.docs
          .map(
            (e) => FeesSubCategoryModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    } on FirebaseException catch (e) {
      showToast(msg: e.code);
      categoryFetchloading.value = false;
      return [];
    }
  }

  //creatin fees for all class
  Future<void> createFeesForAllClass({
    required String categoryId,
    required String categoryName,
    required String subCategory,
    required String amount,
    required String dueDate,
    required String type,
    required String datePeriod,
  }) async {
    try {
      categoryFetchloading.value = true;
      for (var element in allClass) {
        fStore
            .collection("Fees")
            .doc(categoryId)
            .collection(subCategory)
            .doc(subCategory)
            .collection("Classes")
            .doc(element.docid)
            .set(
              FeesModel(
                  datePeriod: datePeriod,
                  subCategoryId: categoryName + datePeriod,
                  categoryId: categoryId,
                  categoryName: categoryName,
                  amount: amount,
                  dueDate: dueDate,
                  classId: element.docid,
                  className: element.className,
                  type: type,
                  studentList: []).toMap(),
            )
            .then((value) async {
          amountController.clear();
          dueDateController.clear();
          selectedSubCategory = null;
        });
      }
      showToast(msg: "Successfully Completed");
      categoryFetchloading.value = false;
    } catch (e) {
      categoryFetchloading.value = false;
      showToast(msg: "Something Went Wrong");
      log(e.toString());
    }
  }

//fees created only specific class
  Future<void> createFeesForSpecificClass(
      String categoryId,
      String categoryName,
      String amount,
      String dueDate,
      String type,
      ClassModel classModel) async {
    categoryFetchloading.value = true;
    fStore
        .collection("classes")
        .doc(classModel.docid)
        .collection("ClassFees")
        .doc(categoryId)
        .set(
          //Todo fix seperate class datePeriod subcategoryid
          FeesModel(
                  categoryId: categoryId,
                  categoryName: categoryName,
                  amount: amount,
                  dueDate: dueDate,
                  classId: classModel.docid,
                  className: classModel.className,
                  type: type,
                  studentList: [],
                  datePeriod: "",
                  subCategoryId: "")
              .toMap(),
        )
        .then((value) async {
      showToast(msg: "Successfully Completed");
      categoryFetchloading.value = false;
      selectedClass = null;
    }).catchError((error) {
      categoryFetchloading.value = false;
      showToast(msg: (error as FirebaseException).code);
      log(error.toString());
    });
  }

//create all tokens
  Future<void> fetchAllTokenList() async {
    try {
      for (var element in allClass) {
        await fetchTokensForCollection(element.docid, "Students");
        await fetchTokensForCollection(element.docid, "ParentCollection");
        await fetchTokensForCollection(element.docid, "GuardianCollection");
      }
    } on FirebaseException catch (e) {
      log(e.toString());
      showToast(msg: e.toString());
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  Future<void> fetchTokensForCollection(
      String docId, String collectionName) async {
    final QuerySnapshot<Map<String, dynamic>> collectionResult = await fStore
        .collection("classes")
        .doc(docId)
        .collection(collectionName)
        .get();

    for (var element in collectionResult.docs) {
      String? deviceToken = element.data()["deviceToken"];

      if (deviceToken == null || deviceToken.isEmpty) {
        continue;
      }

      if (!tokenList.contains(deviceToken)) {
        tokenList.add(deviceToken);
      }
    }
  }
}

// //creating token lists parent,guardian,students
//       await fetchAllTokenList().then((value) async {
//         log("create time ${tokenList.toString()}");
//         for (var element3 in tokenList) {
//           //send push notification from push notification
//           await sendPushMessage(element3,
//               "Due Date : $dueDate Amount : $amount", categoryName);
//         }
//       });
