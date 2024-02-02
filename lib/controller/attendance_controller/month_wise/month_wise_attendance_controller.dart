import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';

import '../../../model/student_attendance_model/student_attendance_model.dart';
import '../../../view/constant/constant.dart';
import '../../admin_login_screen/admin_login_screen_controller.dart';
import '../../get_firebase-data/get_firebase_data.dart';
import '../attendance_controller.dart';
import 'mont_wise_models/attendance_alldate_model.dart';
import 'mont_wise_models/student_subjectwise_alldata_model.dart';

class MonthWiseAttendanceController {
  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('classes')
          .doc(Get.find<AttendanceController>().classId.value)
          .collection('Attendence');
  List<AttendanceDateModelAllData> monthWiseAllAttendanceData = [];
  RxList<String> studentNamesList = RxList([]);
  RxList<StudentSubjectModelAllData> periodIdsList = RxList([]);
  RxList<String> subjectNameList = RxList([]);
  RxString monthWiseMonthId = RxString("");
  RxString monthWiseSubjectId = RxString("");
  String selectedSubjectName = "";
  RxBool isLoadinggetMonth = RxBool(false);
  RxBool isLoadingfetchallList = RxBool(false);
  RxBool isLoadinggetStudentName = RxBool(false);
  RxBool isLoadinggetSubjects = RxBool(false);

  /// [1] First step: Fetching all months [getAllAttendanceMonths] as a list of maps.
  /// This function is called when the [MonthSelectDropDownSearchWidgetMonthly] dropdown is tapped.
  /// In the [MonthSelectDropDownSearchWidgetMonthly] dropdown's onTap function, two functions are called:
  /// 1. [fetchPercentageWiseData] : This is the main function that fetches all Firebase data into Dart models.
  /// 2. After the completion of [fetchPercentageWiseData], [fetchAllSubjectIds] and [createStudentsNameList] functions will be called.

  /// [2] Second step: calling [calculateMonthlyAttendance] this function for calculate monthly subjects wise present absent

  Future<List<String>> getAllAttendanceMonths() async {
    try {
      isLoadinggetMonth.value = true;
      final QuerySnapshot<Map<String, dynamic>> data =
          await firebaseFirestore.get();
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
    studentNamesList.value = [];
    try {
      isLoadinggetStudentName.value = true;
      for (var attendanceDateModel in monthWiseAllAttendanceData) {
        List<StudentSubjectModelAllData> subjects =
            attendanceDateModel.subjects ?? [];

        for (var subject in subjects) {
          List<StudentAttendanceModel> attendanceRecords = subject.present;

          for (var attendanceRecord in attendanceRecords) {
            String studentName = attendanceRecord.studentName;
            if (!studentNamesList.contains(studentName)) {
              studentNamesList.add(studentName);
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

  List<String> fetchAllSubjectIds(
      List<AttendanceDateModelAllData> attendanceData) {
    try {
      isLoadinggetSubjects.value = true;
      periodIdsList.value = [];
      // Iterate over each AttendanceDateModelAllData
      for (var attendanceDateModel in attendanceData) {
        // Extract the subjects from the AttendanceDateModelAllData
        List<StudentSubjectModelAllData> subjects =
            attendanceDateModel.subjects ?? [];

        // Iterate over each StudentSubjectModelAllData
        for (var subject in subjects) {
          if (!periodIdsList.contains(subject)) {
            periodIdsList.add(subject);
          }
          if (!subjectNameList.contains(subject.subject)) {
            subjectNameList.add(subject.subject);
          }
        }
      }

      return subjectNameList;
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

      // Iterate over each AttendanceDateModelAllData
      for (var attendanceDateModel in attendanceData) {
        List<StudentSubjectModelAllData> subjects =
            attendanceDateModel.subjects ?? [];

        // Iterate over each StudentSubjectModelAllData
        for (var subjectModel in subjects) {
          String subjectName = subjectModel.subject;

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
              }
            }
          }
        }
      }
      isLoadinggetStudentName.value = false;
      int totalDay = subjectPresentDays + subjectAbsentDays;
      double percentage = (subjectPresentDays * 100 / totalDay).isNaN
          ? 0
          : (subjectPresentDays * 100 / totalDay);

      double formattedPercentage = double.parse(percentage.toStringAsFixed(1));

      return {
        "present": subjectPresentDays,
        "absent": subjectAbsentDays,
        "total": totalDay,
        "percentage": formattedPercentage
      };
    } catch (e) {
      isLoadinggetStudentName.value = false;
      log(e.toString());
      return {};
    }
  }

  Future<void> createExcelReport() async {
    if (Get.find<AttendanceController>().classId.value.isEmpty ||
        studentNamesList.isEmpty ||
        monthWiseAllAttendanceData.isEmpty ||
        monthWiseSubjectId.value.isEmpty) {
      return showToast(msg: "Please select all fields");
    }
    Excel excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    String className =
        await getClassName(Get.find<AttendanceController>().classId.value);
    sheetObject.merge(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
        CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: 0),
        customValue: TextCellValue(
            'Month :${monthWiseMonthId.value}   Class Name : $className   Subject Name : ${monthWiseSubjectId.value}'));

    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1))
        .value = const TextCellValue("Student Name");
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1))
        .value = const TextCellValue("Present Hours");
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 1))
        .value = const TextCellValue("Absent Hours");
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 1))
        .value = const TextCellValue("Total Hours (Present+Absent)");
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 1))
        .value = const TextCellValue("Attendance Percentage");

    for (int i = 0; i < studentNamesList.length; i++) {
      final Map<String, num> result = calculateMonthlyAttendance(
        monthWiseAllAttendanceData,
        monthWiseSubjectId.value,
        studentNamesList[i],
      );
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 2))
          .value = TextCellValue(studentNamesList[i]);
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 2))
          .value = TextCellValue(result["present"].toString());
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 2))
          .value = TextCellValue(result["absent"].toString());
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 2))
          .value = TextCellValue(result["total"].toString());
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 2))
          .value = TextCellValue("${result["percentage"]}%");
    }
    excel.save(fileName: 'abc.xlsx');
  }

  Future<String> getClassName(String classId) async {
    final data = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(classId)
        .get();
    return data.data()?["className"] ?? " ";
  }
}