import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../model/class_model/class_model.dart';
import '../../model/fees_bills_model/fees_category_model.dart';
import '../../model/fees_bills_model/fees_model.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesCreateController extends GetxController {
  static String className = "FeesCreateController";
  List<ClassModel> allClassLists = [];
  RxBool isLoding = RxBool(false);
  RxBool isClassShow = RxBool(false);
  ClassModel? selectedClassModel;
  TextEditingController feesNameTextController = TextEditingController();
  TextEditingController createdDateTextController = TextEditingController();
  TextEditingController feesPeriodTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  TextEditingController dueDateTextController = TextEditingController();

  CategoryModel? selectedCategory;
  final CollectionReference<Map<String, dynamic>> _fireStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value)
      .collection("Fees");

  Future<List<CategoryModel>> fetchAllCategories() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> feesCategoryData =
          await _fireStore.doc("Fees").collection("FeesCategory").get();

      return feesCategoryData.docs
          .map((e) => CategoryModel.fromMap(e.data()))
          .toList();
    } catch (e) {
      log(e.toString(), name: "$className-fetchAllCategories");
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  Future<List<ClassModel>> fetchAllClasses() async {
    try {
      final allClassData = await FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("classes")
          .get();
      allClassLists =
          allClassData.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      return allClassLists;
    } catch (e) {
      log(e.toString(), name: "$className-fetchAllClasses");
      showToast(msg: "Something went wrong");
      return [];
    }
  }

  Future<void> createNewFee({
    required FeesModel feeModel,
  }) async {
    try {
      isLoding.value = true;
      await fetchAllClasses();
      String trimmedFeesName = feeModel.feesName.replaceAll(" ", "");
      String feesId = trimmedFeesName + uuid.v1();

      for (var element in allClassLists) {
        await _fireStore
            .doc("Fees")
            .collection("SchoolFees")
            .doc(element.docid)
            .set({"id": element.docid, "className": element.className}).then(
                (value) async {
          await _fireStore
              .doc("Fees")
              .collection("SchoolFees")
              .doc(element.docid)
              .collection("AllFees")
              .doc(feesId)
              .set(feeModel
                  .copyWith(
                      feesId: feesId,
                      classId: element.docid,
                      className: element.className)
                  .toMap());
        });
      }
      clearTextFields();
      isLoding.value = false;
      showToast(msg: "Successfully Created");
    } catch (e) {
      showToast(msg: "Something went wrong");
      log(e.toString());
      isLoding.value = false;
    }
  }

  Future<void> createFeeSpecificClass(
      {required FeesModel feeModel, required ClassModel classModel}) async {
    try {
      isLoding.value = true;
      String trimmedFeesName = feeModel.feesName.replaceAll(" ", "");
      String feesId = trimmedFeesName + uuid.v1();
      await _fireStore
          .doc("Fees")
          .collection("ClassFees")
          .doc(classModel.docid)
          .set({
        "id": classModel.docid,
        "className": classModel.className
      }).then((value) async {
        await _fireStore
            .doc("Fees")
            .collection("ClassFees")
            .doc(classModel.docid)
            .collection("AllFees")
            .doc(feesId)
            .set(feeModel
                .copyWith(
                    feesId: feesId,
                    classId: classModel.docid,
                    className: classModel.className)
                .toMap());
      });
      clearTextFields();
      isLoding.value = false;
      showToast(msg: "Successfully Created");
    } catch (e) {
      showToast(msg: "Something went wrong");
      log(e.toString());
      isLoding.value = false;
    }
  }

  void clearTextFields() {
    feesNameTextController.clear();
    createdDateTextController.clear();
    feesPeriodTextController.clear();
    amountTextController.clear();
    dueDateTextController.clear();
    selectedCategory = null;
  }
}
