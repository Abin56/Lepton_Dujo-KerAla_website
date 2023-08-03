import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../view/web/widgets/drop_DownList/schoolDropDownList.dart';

class GetFireBaseData extends GetxController {
  RxString getTeacherClassRole = ''.obs;
  RxString bYear = ''.obs;
  RxString teacherName = ''.obs;
  RxString className = ''.obs;
  RxString classIDD = ''.obs;
  RxString schoolName = ''.obs;
  RxString placeNameofSchool = ''.obs;
  RxString parentNAme = ''.obs;
  RxString classIDForaddSubject = ''.obs;
  RxString classTeacherdocid = ''.obs;
  RxString classTeacherName = ''.obs;
  Future<void> getBatchYearId() async {
    // log("Get.find<GetFireBaseData>().bYear.value${Get.find<GetFireBaseData>().bYear.value}");
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue?['docid'])
        .get();
    bYear.value = vari.data()!['batchYear'];
    log('getx data >>>>>>>>>>>>>>>>>${bYear.value}');
  }

  Future<void> getTeacherClassRoll() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue?['docid'])
        .collection("Teachers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    getTeacherClassRole.value = vari.data()!['classID'];
    log('getx data >>>>>>>>>>>>>>>>>$bYear');
  }

  Future<void> getTeacherDetail(String teacherID) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue?['docid'])
        .collection("Teachers")
        .doc(teacherID)
        .get();
    teacherName.value = vari.data()!['teacherName'];
      log('Teacher Nameee data >>>>>>>>>>>>>>>>>$teacherName');
  }

  Future<void> getClassDetail(String classID) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue?['docid'])
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection("classes")
        .doc(classID)
        .get();
    className.value = vari.data()!['className'];
    classIDD.value = vari.data()!['docid'];
    classTeacherdocid.value = vari.data()!['classTeacherdocid'];
    classTeacherName.value = vari.data()!['classTeacherName'];
  }

  Future<void> getSchoolDetail() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue?['docid'])
        .get();
    schoolName.value = vari.data()!['schoolName'];
    placeNameofSchool.value = vari.data()!['place'];
  }

  Future<void> getParentDetail(String studentID) async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(schoolListValue?['docid'])
        .collection("Students_Parents")
        .where('studentID', isEqualTo: studentID)
        .get();
    parentNAme.value = vari.docs[0].data()['parentName'];
  }

  @override
  void onInit() async {
    await getBatchYearId();
    await getTeacherClassRoll();

    super.onInit();
  }
}
