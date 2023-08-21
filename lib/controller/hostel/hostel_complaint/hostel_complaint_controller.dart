import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:get/get.dart';

import '../../../model/hostel/hostel_model_complaint.dart';
import '../../admin_login_screen/admin_login_screen_controller.dart';

class HostelComplaintController {
  final _fireStore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection("Hostel")
      .doc("Hostel")
      .collection("Complaints");
  Future<List<HostelModelComplaint>> fetchAllComplaints() async {
    try {
      final data = await _fireStore.get();
      return data.docs
          .map((e) => HostelModelComplaint.fromMap(e.data()))
          .toList();
    } catch (e) {
      log(e.toString());
      showToast(msg: 'Something went wrong');
      return [];
    }
  }
}
