import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/teacher/teacher_model.dart';

class TeachersProfileList extends GetxController {
  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> categoryCollections = [];
   RxnInt indexValue = RxnInt();
  Stream<List<TeacherModel>> getProduct(String type,id) {
    log(">>>>>>>>iddddddddddddddddddddddddd${type}");
    String catData = '';
    for (Map<String, dynamic> map in categoryCollections) {
      if (map["courseTitle"] == type) {
        catData = map["id"];
      }
    }
    final data = FirebaseFirestore.instance
        .collection("SchoolListCollection").doc(id).collection("Teachers")
        // .orderBy("dateTime", descending: true)
        .where('ptaCategory', isEqualTo: catData)
        .snapshots();
    final d = data.map((event) =>
        event.docs.map((e) => TeacherModel.fromMap(e.data())).toList());
    log('lepton>>>>>>>>>>>>>>>...${d.toString()}');

    return d;
  }

  Future<List<Map<String, dynamic>>> fetchingCategory() async {
    List<Map<String, dynamic>> list = [];
    await FirebaseFirestore.instance
        .collection("SchoolListCollection").doc().collection("Teachers")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        list.add(element.data());
      });
    });
    list1 = list;
    log(list.toString());

    categoryCollections = list;
    log(list.toString(), name: "calling");
    update();
    return list;
  }

  @override
  void onInit() {
    fetchingCategory();
    super.onInit();
  }
}
