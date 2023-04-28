import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/get_classes.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class GetFireBaseData extends GetxController {
  RxString bYear = ''.obs;
  RxString teacherName = ''.obs;
  RxString className = ''.obs;
  RxString classIncharge = ''.obs;
  RxString schoolName = ''.obs;
  RxString placeNameofSchool = ''.obs;
  RxString parentNAme = ''.obs;

  Future<void> getBatchYearId() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .get();
    bYear.value = vari.data()!['batchYear'];
    log('getx data >>>>>>>>>>>>>>>>>${bYear}');
  }

  Future<void> getTeacherDetail(String teacherID) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection("Teachers")
        .doc(teacherID)
        .get();
    teacherName.value = vari.data()!['teacherName'];
  }

  Future<void> getClassDetail(String classID) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("Classes")
        .doc(classID)
        .get();
    className.value = vari.data()!['className'];
    classIncharge.value = vari.data()!['classIncharge'];
  }

  Future<void> getSchoolDetail() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .get();
    schoolName.value = vari.data()!['schoolName'];
    placeNameofSchool.value = vari.data()!['place'];
  }

  Future<void> getParentDetail(String studentID) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection("Students_Parents")
        .where('studentID', isEqualTo: studentID)
        .get();
    parentNAme.value = vari.docs[0].data()['parentName'];
  }

  @override
  void onInit() async {
    await getBatchYearId();

    super.onInit();
  }
}
