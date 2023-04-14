import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/food_and_beverage/food_and_beverage.dart';
import '../../../view/constant/constant.dart';

class FoodAndBeverageController extends GetxController {
  RxBool isLoading = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createFoodAndBeverage({
    required String schoolId,
    required FoodAndBeverage ptaModel,
  }) async {
    try {
      isLoading.value = true;
      final data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('FANDB')
          .add(
            ptaModel.toJson(),
          );
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('FANDB')
          .doc(data.id)
          .update({"id": data.id});

      isLoading.value = false;
      showToast(msg: 'Successfully Created');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateFoodAndBeverage(
      {required String schoolId,
      required FoodAndBeverage foodAndBeverage,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('FANDB')
          .doc(documentId)
          .update(
            foodAndBeverage.toJson(),
          );

      isLoading.value = false;
      showToast(msg: 'Successfully Updated');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(
        msg: e.toString(),
      );

      print(e.toString());
    }
  }
}
