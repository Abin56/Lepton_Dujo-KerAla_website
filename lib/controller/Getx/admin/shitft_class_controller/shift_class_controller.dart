import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:get/get.dart';

import '../../../../model/class_model/class_model.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';

class ShiftClassController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  RxnString oldClassId = RxnString();
  String newClassId = "";
  String batchId = "";

  //fetching current class data
  Future<List<ClassModel>> geOldClass() async {
    final QuerySnapshot<Map<String, dynamic>> result = await fireStore
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .get();

    List<ClassModel> oldClassesList =
        result.docs.map((e) => ClassModel.fromMap(e.data())).toList();
    return oldClassesList;
  }
}
