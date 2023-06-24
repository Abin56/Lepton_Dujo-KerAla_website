import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../model/bus_route_model/bus_route_model.dart';

class BusRouteController {
  final firebaseFirestore = FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection("BusRoute");
  final Uuid uuid = const Uuid();
  RxBool isLoading = RxBool(false);

  Future<void> createBusRoute({
    required String routeNumber,
    required String busNumber,
    required String driveMobNum,
    required String assistantMobNum,
    required String staffInCharge,
  }) async {
    try {
      isLoading.value = true;
      final String docId = uuid.v1();
      final BusRouteModel busData = BusRouteModel(
          routeNumber: routeNumber,
          busNumber: busNumber,
          driveMobNum: driveMobNum,
          assistantMobNum: assistantMobNum,
          staffInCharge: staffInCharge,
          docId: docId);
      await firebaseFirestore.doc(docId).set(busData.toMap());
      isLoading.value = false;
      showToast(msg: "Successfully Created");
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      showToast(msg: "Something Went Wrong");
    }
  }
}
