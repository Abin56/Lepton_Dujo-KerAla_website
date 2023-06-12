// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/student_attendance_model/student_attendance_model.dart';
import '../../view/constant/constant.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';
import 'attendance_controller.dart';

class MonthWiseAttendanceController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<AttendanceDateModelAllData> monthWiseAllAttendanceData = [];
  RxList<String> studentNames = RxList([]);
  RxList<StudentSubjectModelAllData> subjectIds = RxList([]);
  RxString monthWiseMonthId = RxString("");
  RxString monthWiseSubjectId = RxString("");
  RxBool isLoadinggetMonth = RxBool(false);
  RxBool isLoadingfetchallList = RxBool(false);
  RxBool isLoadinggetStudentName = RxBool(false);
  RxBool isLoadinggetSubjects = RxBool(false);

//*****************first step fetch all month data*/

  Future<List<String>> getAllAttendanceMonths() async {
    try {
      isLoadinggetMonth.value = true;
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(Get.find<AttendanceController>().classId.value)
          .collection('Attendence')
          .get();
      final result = data.docs.map((e) => e.data()["id"].toString()).toList();
      isLoadinggetMonth.value = false;

      return result;
    } catch (e) {
      isLoadinggetMonth.value = false;
      showToast(msg: 'Something Went Wrong');
      log(e.toString());
      return [];
    }
  }
  //**********************first step complete */

//fetching all dates
  Future<List<AttendanceDateModelAllData>> fetchPercentageWiseData() async {
    try {
      isLoadingfetchallList.value = true;
      monthWiseAllAttendanceData.clear();
      // Fetching all dates
      final List<AttendanceDateModelAllData> allDateList =
          await getAllAttendanceDateWiseAllData();
      //add date model to monthWiseAllAttendanceData
      for (var element in allDateList) {
        monthWiseAllAttendanceData.add(element);
      }
      //add each subject to date list
      for (int i = 0; i < monthWiseAllAttendanceData.length; i++) {
        final a =
            await getAllSubjectForMonthly(monthWiseAllAttendanceData[i].docid);
        monthWiseAllAttendanceData[i].subjects = a;
      }
//add each student value to subject model
      for (int i = 0; i < monthWiseAllAttendanceData.length; i++) {
        for (int j = 0;
            j < monthWiseAllAttendanceData[i].subjects!.length;
            j++) {
          final b = await getAllStudentsFromDate(
              monthWiseAllAttendanceData[i].subjects![j].docid,
              monthWiseAllAttendanceData[i].docid);
          monthWiseAllAttendanceData[i].subjects?[j].present = b;
        }
      }
      isLoadingfetchallList.value = false;
      return monthWiseAllAttendanceData;
    } catch (e) {
      isLoadingfetchallList.value = false;
      log(e.toString());
      return [];
    }
  }

//first
  Future<List<AttendanceDateModelAllData>>
      getAllAttendanceDateWiseAllData() async {
    if (monthWiseMonthId.value.isEmpty) {
      return [];
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(Get.find<AttendanceController>().classId.value)
          .collection('Attendence')
          .doc(monthWiseMonthId.value)
          .collection(monthWiseMonthId.value)
          .get();

      final List<AttendanceDateModelAllData> dateWiseAttendance = data.docs
          .map((e) => AttendanceDateModelAllData.fromJson(e.data()))
          .toList();
      return dateWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong');
      log(e.toString());
      return [];
    }
  }

//second
  Future<List<StudentSubjectModelAllData>> getAllSubjectForMonthly(
      String dateValue) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(Get.find<AttendanceController>().classId.value)
          .collection('Attendence')
          .doc(monthWiseMonthId.value)
          .collection(monthWiseMonthId.value)
          .doc(dateValue)
          .collection('Subjects')
          .get();

      final List<StudentSubjectModelAllData> subjectWiseAttendance = data.docs
          .map((e) => StudentSubjectModelAllData.fromJson(e.data()))
          .toList();

      return subjectWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong ${e.toString()}');
      log(e.toString());
      return [];
    }
  }

  //fetching all students model
  Future<List<StudentAttendanceModel>> getAllStudentsFromDate(
      String subjectIdnew, String dateIdnew) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(Get.find<AttendanceController>().classId.value)
          .collection('Attendence')
          .doc(monthWiseMonthId.value)
          .collection(monthWiseMonthId.value)
          .doc(dateIdnew)
          .collection('Subjects')
          .doc(subjectIdnew)
          .collection('PresentList')
          .get();

      final List<StudentAttendanceModel> subjectWiseAttendance = data.docs
          .map((e) => StudentAttendanceModel.fromMap(e.data()))
          .toList();

      return subjectWiseAttendance;
    } catch (e) {
      showToast(msg: 'Something Went Wrong ${e.toString()}');
      log(e.toString());
      return [];
    }
  }

//fetch all students data from collection
  void createStudentsNameList() {
    try {
      isLoadinggetStudentName.value = true;
      for (var attendanceDateModel in monthWiseAllAttendanceData) {
        List<StudentSubjectModelAllData> subjects =
            attendanceDateModel.subjects ?? [];

        for (var subject in subjects) {
          List<StudentAttendanceModel> attendanceRecords = subject.present;

          for (var attendanceRecord in attendanceRecords) {
            String studentName = attendanceRecord.studentName;
            if (!studentNames.contains(studentName)) {
              studentNames.add(studentName);
            }
          }
        }
      }
      isLoadinggetStudentName.value = false;
    } catch (e) {
      log(e.toString());
      isLoadinggetStudentName.value = false;
    }
  }

  List<StudentSubjectModelAllData> fetchAllSubjectIds(
      List<AttendanceDateModelAllData> attendanceData) {
    try {
      isLoadinggetSubjects.value = true;
      subjectIds.value = [];
      // Iterate over each AttendanceDateModelAllData
      for (var attendanceDateModel in attendanceData) {
        // Extract the subjects from the AttendanceDateModelAllData
        List<StudentSubjectModelAllData> subjects =
            attendanceDateModel.subjects ?? [];

        // Iterate over each StudentSubjectModelAllData
        for (var subject in subjects) {
          if (!subjectIds.contains(subject)) {
            subjectIds.add(subject);
          }
        }
      }

      return subjectIds;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Map<String, num> calculateMonthlyAttendance(
      List<AttendanceDateModelAllData> attendanceData,
      String subject,
      String student) {
    try {
      isLoadinggetStudentName.value = true;
      // Create a map to store subject-wise attendance information
      int subjectPresentDays = 0;
      int subjectAbsentDays = 0;
      int subjectTotalDays = 0;

      // Iterate over each AttendanceDateModelAllData
      for (var attendanceDateModel in attendanceData) {
        List<StudentSubjectModelAllData> subjects =
            attendanceDateModel.subjects ?? [];

        // Iterate over each StudentSubjectModelAllData
        for (var subjectModel in subjects) {
          String subjectName = subjectModel.docid;

          // Check if the current subject matches the provided subject
          if (subjectName == subject) {
            List<StudentAttendanceModel> attendanceRecords =
                subjectModel.present;

            // Iterate over each attendance record
            for (var attendanceRecord in attendanceRecords) {
              // Extract the student's name and attendance status
              String studentName = attendanceRecord.studentName;
              bool isPresent = attendanceRecord.present;

              // Check if the student is the one we're interested in
              if (studentName == student) {
                // Increment the subject-wise attendance count if present
                if (isPresent) {
                  subjectPresentDays++;
                } else {
                  subjectAbsentDays++;
                }
                subjectTotalDays++;
              }
            }
          }
        }
      }
      isLoadinggetStudentName.value = false;
      return {
        "present": subjectPresentDays,
        "absent": subjectAbsentDays,
        "total": subjectTotalDays,
        "percentage": subjectPresentDays == 0 && subjectTotalDays == 0
            ? 0
            : ((subjectPresentDays / subjectTotalDays) * 100).round()
      };
    } catch (e) {
      isLoadinggetStudentName.value = false;
      log(e.toString());
      return {};
    }
  }
}

//*********************Attendance Date Wise Model */

class AttendanceDateModelAllData {
  String dDate;
  String day;
  String docid;
  List<StudentSubjectModelAllData>? subjects;

  AttendanceDateModelAllData({
    required this.dDate,
    required this.day,
    required this.docid,
    this.subjects,
  });

  factory AttendanceDateModelAllData.fromJson(Map<String, dynamic> json) =>
      AttendanceDateModelAllData(
        dDate: json["dDate"] ?? "",
        day: json["day"] ?? "",
        docid: json["docid"] ?? "",
        subjects: List<StudentSubjectModelAllData>.from(json["subjects"] ?? []),
      );

  @override
  String toString() {
    return 'AttendanceDateModelAllData(dDate: $dDate, day: $day, docid: $docid, subjects: $subjects)';
  }

  @override
  bool operator ==(covariant AttendanceDateModelAllData other) {
    if (identical(this, other)) return true;

    return other.dDate == dDate &&
        other.day == day &&
        other.docid == docid &&
        listEquals(other.subjects, subjects);
  }

  @override
  int get hashCode {
    return dDate.hashCode ^ day.hashCode ^ docid.hashCode ^ subjects.hashCode;
  }
}

class StudentSubjectModelAllData {
  String date;
  String docid;
  String subject;
  List<StudentAttendanceModel> present;

  StudentSubjectModelAllData({
    required this.date,
    required this.docid,
    required this.subject,
    required this.present,
  });

  factory StudentSubjectModelAllData.fromJson(Map<String, dynamic> json) =>
      StudentSubjectModelAllData(
        date: json["date"],
        docid: json["docid"],
        subject: json["subject"],
        present: List<StudentAttendanceModel>.from(json["present"] ?? []),
      );

  @override
  String toString() {
    return 'StudentSubjectModelAllData(date: $date, docid: $docid, subject: $subject, present: $present)';
  }

  @override
  bool operator ==(covariant StudentSubjectModelAllData other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.subject == subject;
  }

  @override
  int get hashCode {
    return docid.hashCode ^ subject.hashCode;
  }
}
