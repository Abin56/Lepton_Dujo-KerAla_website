import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/hostel/hostel_model_complaint.dart';
import '../../admin_login_screen/admin_login_screen_controller.dart';

class HostelComplaintController {
  RxBool isloading = RxBool(false);
  final _fireStore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection("Hostel")
      .doc("Hostel")
      .collection("Complaints");
  Future<List<HostelModelComplaint>> fetchAllComplaintsCompleted() async {
    try {
      final data = await _fireStore.get();
      final result =
          data.docs.map((e) => HostelModelComplaint.fromMap(e.data())).toList();
      final filteredList =
          result.where((element) => element.isCompleted == true).toList();
      log(filteredList.length.toString());
      return filteredList;
    } catch (e) {
      log(e.toString());
      showToast(msg: 'Something went wrong');
      return [];
    }
  }

  Future<List<HostelModelComplaint>> fetchAllComplaintsUncompleted() async {
    try {
      final data = await _fireStore.get();
      final result =
          data.docs.map((e) => HostelModelComplaint.fromMap(e.data())).toList();
      final filteredList =
          result.where((element) => element.isCompleted == false).toList();
      return filteredList;
    } catch (e) {
      log(e.toString());
      showToast(msg: 'Something went wrong');
      return [];
    }
  }

  Future<void> updateSolvedOrNot({
    required String docId,
    required bool isSolved,
    required BuildContext context,
  }) async {
    try {
      isloading.value = true;
      await _fireStore.doc(docId).update({"isCompleted": isSolved});
      showToast(msg: "Successfully updated");
      isloading.value = false;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something went wrong");
      isloading.value = false;
    }
  }
}
