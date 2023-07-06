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
import '../../utils/utils.dart';

class FeesCreateController extends GetxController {
  ///for unique id creation
  final Uuid uuid = const Uuid();

  TextEditingController amountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  //category name dropdown selected category
  FeesCategoryModel? selectedMainCategory;
  //selected subcategory from
  FeesSubCategoryModel? selectedSubCategory;
  RxBool isLoading = RxBool(false);
//fetching all classes for creating fees
  List<ClassModel> allClass = [];

  final DocumentReference<Map<String, dynamic>> fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  @override
  void onInit() async {
    await getAllClasses();
    super.onInit();
  }

  ///category creation varibles
  RxString selectedType = RxString("");

  List<String> tokenList = [];
//this for add category only selected class if this value is true then selected school dropdown will show
  RxBool isSpecificClassOnly = RxBool(false);
  ClassModel? selectedClass;

  //fetch category list

  Future<List<FeesCategoryModel>> fetchCategoryList() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await fStore.collection("Fees").get();
      return data.docs.map((e) => FeesCategoryModel.fromMap(e.data())).toList();
    } catch (e) {
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  //fetch sub category list

  Future<List<FeesSubCategoryModel>> fetchSubCategoryList(
      String categoryId) async {
    if (selectedMainCategory == null) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await fStore
          .collection("Fees")
          .doc(categoryId)
          .collection("SubCategory")
          .orderBy("createdAt")
          .get();
      return data.docs
          .map(
            (e) => FeesSubCategoryModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    } on FirebaseException catch (e) {
      showToast(msg: e.code);
      return [];
    }
  }

  //creatin fees for all class
  Future<void> createFeesForAllClass(
      {required String categoryId,
      required String subCategoryId,
      required String categoryName,
      required String amount,
      required String dueDate,
      required String type,
      required String subCategoryName}) async {
    try {
      isLoading.value = true;
      for (var element in allClass) {
        await fStore
            .collection("Fees")
            .doc(categoryId)
            .collection("SubCategory")
            .doc(subCategoryId)
            .collection("Classes")
            .doc(element.docid)
            .set(
              FeesModel(
                  categoryId: categoryId,
                  categoryName: categoryName,
                  amount: amount,
                  dueDate: dueDate,
                  classId: element.docid,
                  className: element.className,
                  type: type,
                  subCategoryId: subCategoryId,
                  subCategoryName: subCategoryName,
                  studentList: []).toMap(),
            )
            .then((value) async {
          fStore
              .collection("Fees")
              .doc(categoryId)
              .collection("SubCategory")
              .doc(subCategoryId)
              .update({
            "isCreated": true,
          });
          amountController.clear();
          dueDateController.clear();
          selectedSubCategory = null;
          selectedMainCategory = null;
          selectedClass = null;
          isSpecificClassOnly.value = false;
        });
      }
      showToast(msg: "Successfully Completed");
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      showToast(msg: "Something Went Wrong");
      log(e.toString());
    }
  }

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

//fees created only specific class
  Future<void> createFeesForSpecificClass({
    required FeesCategoryModel categoryModel,
    required FeesSubCategoryModel subCategoryModel,
    required String amount,
    required String dueDate,
    required ClassModel classModel,
  }) async {
    isLoading.value = true;

//creating category model fields
    await fStore
        .collection("classes")
        .doc(classModel.docid)
        .collection("ClassFees")
        .doc(categoryModel.id)
        .set(categoryModel.toMap());
//create fees inside subcategory
    await fStore
        .collection("classes")
        .doc(classModel.docid)
        .collection("ClassFees")
        .doc(categoryModel.id)
        .collection("SubCategory")
        .doc(subCategoryModel.id)
        .set(
          FeesModel(
            categoryId: categoryModel.id,
            categoryName: categoryModel.categoryName,
            amount: amount,
            dueDate: dueDate,
            classId: classModel.docid,
            className: classModel.className,
            type: categoryModel.type,
            studentList: [],
            subCategoryId: subCategoryModel.id,
            subCategoryName: subCategoryModel.subCategoryName,
          ).toMap(),
        )
        .then((value) async {
      showToast(msg: "Successfully Completed");
      isLoading.value = false;
      amountController.clear();
      dueDateController.clear();
      selectedSubCategory = null;
      selectedMainCategory = null;
      selectedClass = null;
      isSpecificClassOnly.value = false;
    }).catchError((error) {
      isLoading.value = false;
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

  Future<void> sendAllClassFeesNotification({
    required String dueDate,
    required String amount,
    required String categoryName,
  }) async {
    await fetchAllTokenList().then((value) async {
      log("create time ${tokenList.toString()}");
      for (var element3 in tokenList) {
        //send push notification from push notification
        await sendPushMessage(
            element3, "Due Date : $dueDate Amount : $amount", categoryName);
      }
    });
  }
}
