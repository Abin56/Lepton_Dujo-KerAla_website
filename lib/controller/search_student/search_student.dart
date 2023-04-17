import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStudentInfoFromSearch extends GetxController {
  var list = [].obs;
  getSearchStudent(String query) async {
    FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("SchoolListCollection")
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection("AllStudents")
          .doc(query)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 100,
            width: double.infinity,
            child: Text(snapshot.data!.data()!['id'] ?? ''),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
  @override
  void onInit() {
  var list = [].obs;
    super.onInit();
  }
}
