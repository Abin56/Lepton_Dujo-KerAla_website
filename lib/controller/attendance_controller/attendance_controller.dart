import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:get/get.dart';

import '../../model/attendance_date_model/attendance_date_model.dart';
import '../../model/class_model/class_model.dart';
import '../../model/class_teacher/add_subject/add_subjects.dart';
import '../../model/student_attendance_model/student_attendance_model.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';

class AttendanceController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxString classId = RxString("");
  RxString dateId = RxString("");
  RxString subjectId = RxString("");

//fetch all class data from firebase
  Future<List<ClassModel>> getAllClass() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .get();

      final List<ClassModel> allClass =
          data.docs.map((e) => ClassModel.fromMap(e.data())).toList();
      return allClass;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      return [];
    }
  }

  Future<List<AttendanceDateModel>> getAllAttendanceDateWise() async {
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

      final List<AttendanceDateModel> dateWiseAttendance =
          data.docs.map((e) => AttendanceDateModel.fromMap(e.data())).toList();
      return dateWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      return [];
    }
  }

  Future<List<SubjectModel>> getAllSubject() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(classId.value)
          .collection('Attendence')
          .doc(dateId.value)
          .collection('Subjects')
          .get();

      final List<SubjectModel> subjectWiseAttendance =
          data.docs.map((e) => SubjectModel.fromMap(e.data())).toList();
      return subjectWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      return [];
    }
  }

  Future<List<StudentAttendanceModel>> getAllSubjectWiseAttendance() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(classId.value)
          .collection('Attendence')
          .doc(dateId.value)
          .collection('Subjects')
          .doc(subjectId.value)
          .collection('PresentList')
          .get();

      final List<StudentAttendanceModel> studentsAttendanceModel = data.docs
          .map((e) => StudentAttendanceModel.fromMap(e.data()))
          .toList();
      return studentsAttendanceModel;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      return [];
    }
  }
}
