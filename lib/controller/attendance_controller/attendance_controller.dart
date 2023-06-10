// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:get/get.dart';

import '../../model/attendance_date_model/attendance_date_model.dart';
import '../../model/attendance_subject_model/attendance_subject_model.dart';
import '../../model/student_attendance_model/student_attendance_model.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class AttendanceController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxString classId = RxString("");
  RxString monthId = RxString("");
  RxString dateId = RxString("");
  RxString subjectId = RxString("");
  RxBool isLoading = RxBool(false);
//fetching month attendance data month wise
  Future<List<String>> getAllAttendanceMonthWise() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(classId.value)
          .collection('Attendence')
          .get();

      final List<String> monthData =
          data.docs.map((e) => e["id"].toString()).toList();
      return monthData;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      log(e.toString());
      return [];
    }
  }

//fetching attendance data date wise
  Future<List<AttendanceDateModel>> getAllAttendanceDateWise() async {
    if (monthId.value.isEmpty) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(classId.value)
          .collection('Attendence')
          .doc(monthId.value)
          .collection(monthId.value)
          .get();

      final List<AttendanceDateModel> dateWiseAttendance =
          data.docs.map((e) => AttendanceDateModel.fromMap(e.data())).toList();
      return dateWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      log(e.toString());
      return [];
    }
  }

//fetching attendance data subject wise
  Future<List<AttendanceSubjectModel>> getAllSubject() async {
    if (dateId.value.isEmpty) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(classId.value)
          .collection('Attendence')
          .doc(monthId.value)
          .collection(monthId.value)
          .doc(dateId.value)
          .collection('Subjects')
          .get();

      final List<AttendanceSubjectModel> subjectWiseAttendance = data.docs
          .map((e) => AttendanceSubjectModel.fromMap(e.data()))
          .toList();

      return subjectWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong ${e.toString()}');
      log(e.toString());
      return [];
    }
  }

  //get student wise attendance data

  Stream<List<StudentAttendanceModel>> getAllSubjectWiseAttendance() {
    if (subjectId.value.isEmpty || dateId.value.isEmpty) {
      return Stream.value([]);
    }

    final Stream<QuerySnapshot<Map<String, dynamic>>> stream = firebaseFirestore
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(classId.value)
        .collection('Attendence')
        .doc(monthId.value)
        .collection(monthId.value)
        .doc(dateId.value)
        .collection('Subjects')
        .doc(subjectId.value)
        .collection('PresentList')
        .snapshots();

    return stream.map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs
          .map((DocumentSnapshot<Map<String, dynamic>> doc) =>
              StudentAttendanceModel.fromMap(doc.data() ?? {}))
          .toList();
    });
  }

  Future<void> updateStudentAttendance(String studentId, bool isPresent) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(classId.value)
          .collection('Attendence')
          .doc(monthId.value)
          .collection(monthId.value)
          .doc(dateId.value)
          .collection('Subjects')
          .doc(subjectId.value)
          .collection('PresentList')
          .doc(studentId)
          .update({"present": isPresent});
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      showToast(msg: "Something Went Wrong$e");
      log(e.toString());
    }
  }


  //*************************************************** it for monthly*/
}


