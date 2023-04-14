import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/pta_model/pta_model.dart';
import '../../../view/constant/constant.dart';

class PtaController extends GetxController {
  RxBool isLoading = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createPta({
    required String schoolId,
    required Ptamodel ptaModel,
  }) async {
    try {
      isLoading.value = true;
      final data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('PTA')
          .add(
            ptaModel.toJson(),
          );
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('PTA')
          .doc(data.id)
          .update({"ptaId": data.id});

      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateMeetingData(
      {required String schoolId,
      required Ptamodel ptaModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('PTA')
          .doc(documentId)
          .update(
            ptaModel.toJson(),
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
