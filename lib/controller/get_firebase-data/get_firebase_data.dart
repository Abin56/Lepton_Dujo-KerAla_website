import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/get_classes.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class GetFireBaseData extends GetxController {
  RxString bYear = ''.obs;
  Future<void> getBatchYearId() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .get();
    bYear.value = vari.data()!['batchYear'];
    log('getx data >>>>>>>>>>>>>>>>>${bYear}');
  }



  @override
  void onInit() async {
    await getBatchYearId();
 
    super.onInit();
  }
}
