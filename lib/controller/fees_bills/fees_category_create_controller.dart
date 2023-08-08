import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FeesCategoryCreateController {
  TextEditingController categoryNameController = TextEditingController();
  static String className = "FeesCreateController";//for log information
  RxBool isLoding = RxBool(false);
  final Uuid uuid = const Uuid();
  final CollectionReference<Map<String, dynamic>> _fireStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value)
      .collection("Fees");

  //create new Category
  Future<void> createNewCategory({
    required String categoryName,
    required BuildContext context,
  }) async {
    String category = categoryName.replaceAll(" ", "");
    String id = category + uuid.v1();
    try {
      if (await isCategoryExist(categoryName: categoryName)) {
        return showToast(msg: "Category already exist");
      }
      isLoding.value = true;
      _fireStore.doc("Fees").collection("FeesCategory").doc(id).set(
        {
          "categoryName": categoryName.toUpperCase(),
          "id": id,
        },
      ).then((value) {
        _fireStore.doc("Fees").set(
          {
            "lastUpate": DateTime.now(),
          },
        );
        isLoding.value = false;
        categoryNameController.clear();
        Navigator.of(context).pop();

        showToast(msg: "Upated Succesfully");
      });
    } catch (e) {
      showToast(msg: "Something went wrong");
      isLoding.value = false;
      log(e.toString(), name: "$className-createNewCategory");
    }
  }

  Future<bool> isCategoryExist({required String categoryName}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await _fireStore.doc("Fees").collection("FeesCategory").get();

      int index = data.docs.indexWhere(
        (element) =>
            categoryName.toUpperCase() ==
            (element["categoryName"] as String).toUpperCase(),
      );
      if (index != -1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: "$className-isCategoryExist");
      return true;
    }
  }
}
