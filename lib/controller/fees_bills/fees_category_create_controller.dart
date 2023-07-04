import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../model/fees_bills_model/fees_category_model.dart';
import '../../model/fees_bills_model/fees_subcategory_model.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class FeesCategoryCreateController extends GetxController {
  ///selected category type[typeOfCategoryList]
  Rx<String> selectedTypeOfCategory = RxString("");
  RxBool isLoading = RxBool(false);
  TextEditingController categoryNameController = TextEditingController();

  final DocumentReference<Map<String, dynamic>> fStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  Future<void> createFeesCategory(
    String categoryName,
    String categoryType,
    BuildContext context,
  ) async {
    try {
      if (selectedTypeOfCategory.isEmpty) {
        return showToast(msg: "Please select category");
      }

      isLoading.value = true;
      final String uid = "$categoryName${uuid.v1()}";

      // Checking category existence
      if (await isCategoryExist(categoryName)) {
        isLoading.value = false;
        showToast(msg: "Failed Category already exists");
      } else {
        // Creating new category

        await createNewCategory(
          categoryName: categoryName,
          categoryType: categoryType,
          uid: uid,
        );

        showToast(msg: "Successfully Created");
        selectedTypeOfCategory.value = "";
      }

      // Creating subcategory
      List<String> subCategories = [];

      switch (categoryType) {
        case "Monthly":
          subCategories = monthly;
          break;
        case "Quarterly":
          subCategories = quarterly;
          break;
        case "Half Yearly":
          subCategories = halfYearly;
          break;
        default:
          subCategories = ["yearly"];
          break;
      }
      for (var element in subCategories) {
        await fStore
            .collection("Fees")
            .doc(uid)
            .collection("SubCategory")
            .doc(categoryName + element)
            .set(
              FeesSubCategoryModel(
                      subCategoryName: element,
                      id: categoryName + element,
                      categoryName: categoryName)
                  .toMap(),
            );
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      showToast(msg: "Something Went Wrong");
    }
  }

  Future<bool> isCategoryExist(String categoryName) async {
    final datas = await fStore
        .collection("Fees")
        .where("categoryName", isEqualTo: categoryName)
        .get();
    if (datas.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createNewCategory({
    required String uid,
    required String categoryName,
    required String categoryType,
  }) async {
    await fStore.collection("Fees").doc(uid).set(FeesCategoryModel(
          categoryName: categoryName,
          id: uid,
          type: categoryType,
        ).toMap());
  }

  final List<String> typeOfCategoryList = [
    'Monthly',
    'Quarterly',
    'Half Yearly',
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
  RxList<String> quarterly = [
    "Jan-Mar",
    "Apr-Jun",
    "Jul-Sep",
    "Oct-Dec",
  ].obs;
  RxList<String> halfYearly = <String>[
    "Jan-Jun",
    "Jul-Dec",
  ].obs;

  String changeFirstThreeCharacters(String originalString, String newPrefix) {
    String remainingPart = originalString.substring(3);
    return newPrefix + remainingPart;
  }

  String changeLastThreeCharacters(String originalString, String newSuffix) {
    String prefix = originalString.substring(0, originalString.length - 3);
    return prefix + newSuffix;
  }

  String getMonths(int value) {
    switch (value) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";

      default:
        return "";
    }
  }

  void changePeriodHalfYearly(
      {required BuildContext context,
      required int index,
      required bool isFirstThreeCharacter}) async {
    final DateTime? result = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
    );
    if (result != null) {
      final String month = getMonths(result.month);
      String changedMonth = "";
      if (isFirstThreeCharacter) {
        changedMonth = changeFirstThreeCharacters(halfYearly[index], month);
      } else {
        changedMonth = changeLastThreeCharacters(halfYearly[index], month);
      }
      halfYearly[index] = changedMonth;
      halfYearly.refresh();
    }
  }

  void changePeriodQuarterly(
      {required BuildContext context,
      required int index,
      required bool isFirstThreeCharacter}) async {
    final DateTime? result = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
    );
    if (result != null) {
      final String month = getMonths(result.month);
      String changedMonth = "";
      if (isFirstThreeCharacter) {
        changedMonth = changeFirstThreeCharacters(quarterly[index], month);
      } else {
        changedMonth = changeLastThreeCharacters(quarterly[index], month);
      }
      quarterly[index] = changedMonth;
      quarterly.refresh();
    }
  }

  String splitString({required String value, required int index}) {
    return value.split("-")[index].trim();
  }
}
