import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/model/attendance_date_model/attendance_date_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';

import '../../model/attendance_subject_model/attendance_subject_model.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AttendanceExcelReportController {
  RxBool isLoading = RxBool(false);

  ///this values for excel creation
  AttendanceDateModel? dayModel;
  AttendanceSubjectModel? subjectModel;
  Map<String, dynamic> dayWiseReport = {};
  DocumentReference<Map<String, dynamic>> firebaseFirestore = FirebaseFirestore
      .instance
      .collection('SchoolListCollection')
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value);

  Future<void> generateDayWiseExcelReport(
      String classId, String monthId, String dayId) async {
    try {
      isLoading.value = true;
      final QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
          .collection('classes')
          .doc(classId)
          .collection('Attendence')
          .doc(monthId)
          .collection(monthId)
          .doc(dayId)
          .collection("Subjects")
          .get();

      final List<Map<String, dynamic>> subjectList =
          data.docs.map((e) => e.data()).toList();

      for (var element in subjectList) {
        final QuerySnapshot<Map<String, dynamic>> studentList =
            await firebaseFirestore
                .collection('classes')
                .doc(classId)
                .collection('Attendence')
                .doc(monthId)
                .collection(monthId)
                .doc(dayId)
                .collection("Subjects")
                .doc(element["docid"])
                .collection("PresentList")
                .get();

        ///"This data does not contain a subject name, so I added a subject name to that map and created a new map."
        ///new map
        /// {"1": [
        ///   {
        ///     "uid": "SiKIG2uywjUnnDnC2dMNkDv5DqH2",
        ///     "studentName": "AbinJohn",
        ///     "Date": "2023-07-03 15:38:53.488957",
        ///     "present": false,
        ///     "subjectName": "English"
        ///   },
        /// ]
        /// }

        dayWiseReport.putIfAbsent(
          element["period"],
          () => studentList.docs.map((e) {
            Map<String, dynamic> data = e.data();
            data["subjectName"] = element["subject"];
            return data;
          }).toList(),
        );
      }

      ///"This map contains attendance data organized by subject,
      ///but I need attendance data organized by student.
      ///Therefore, I have transformed this map into a student-wise map [newStudentMap] ."
      ///key is student id

      ///for creating [newStudentMap] creating new map key is student id value is student name [studentList]

      ///{
      ///SiKIG2uywjUnnDnC2dMNkDv5DqH2: AbinJohn,
      /// B1cL32NH7fdi8BjsqQsQM1vklwo1: Akz, TVAbJgIJZlOS9dQ10pYyXG1EGX73: V1,
      /// dBo5ZgtDNsXGpS4IAejBKJcEeS72: V3, 3x2eTwmZTTeAS7xXjViULyA7ARJ2: v2
      /// }

      Map<String, dynamic> studentList = {};

      ///iterating each key and value each period
      dayWiseReport.forEach((key, value) {
        for (int i = 0; i < (value as List<Map<String, dynamic>>).length; i++) {
          ///creating new key to [studentList] it is student id
          studentList[value[i]["uid"]] = value[i]["studentName"];
        }
      });

      ///creating new map with that studetId as key [newStudentMap]
      /// {
      /// "SiKIG2uywjUnnDnC2dMNkDv5DqH2":
      /// [
      ///   {
      ///     "studentName": "AbinJohn",
      ///     "subjectName": "English",
      ///     "periodName": "1",
      ///     "present": false
      ///   }
      /// ]
      /// },

      Map<String, dynamic> newStudentMap = {};

      ///iterating each student id from [studentList]
      studentList.forEach((studentId, studentName) {
        ///[dayWiseReport] this map contains all datas
        dayWiseReport.forEach((key, value) {
          for (int i = 0;
              i < (value as List<Map<String, dynamic>>).length;
              i++) {
            ///[value] contains this map {
            ///   "uid": "B1cL32NH7fdi8BjsqQsQM1vklwo1",
            ///   "Date": "2023-07-03 18:10:11.471710",
            ///   "studentName": "Akz",
            ///   "present": true,
            ///   "subjectName": "Malayalam"
            /// },

            /// checking student id contains that map because need to get that student data
            if (value[i].containsValue(studentId)) {
              List<Map<String, dynamic>> studentList =
                  newStudentMap[value[i]["uid"]] ?? [];

              ///creating new model
              studentList.add({
                "studentName": studentName,
                "subjectName": value[i]["subjectName"],
                "periodName": key,
                "present": value[i]["present"]
              });
              newStudentMap[value[i]["uid"]] = studentList;
            }
          }
        });
      });

      ///creating excel file

      Excel excel = Excel.createExcel();
      Sheet sheetObject = excel['Sheet1'];

      String className = await getClassName(classId);

      sheetObject.merge(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
          CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: 0),
          customValue: TextCellValue(
              'Date :${dayModel?.dDate ?? " "}   Class Name : $className'));

      ///after each iteration [rowindex] will increase with +1
      ///seperating students data
      int rowIndex = 1;

      ///[periodIndex] it for period is first column
      ///after one subject printed then it will be [periodIndex]+2
      ///same happend [subjectNameIndex] [presentAbsentIndex]
      int periodIndex = 1;
      int subjectNameIndex = 2;
      int presentAbsentIndex = 3;

      newStudentMap.forEach((key, values) {
        for (int i = 0; i < (values as List).length; i++) {
          //creating headings it shows only first row each column
          sheetObject
              .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1))
              .value = const TextCellValue("Student Name");

          sheetObject
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: periodIndex + i, rowIndex: 1))
              .value = const TextCellValue("Period");
          sheetObject
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: subjectNameIndex + i, rowIndex: 1))
              .value = const TextCellValue("Subject");
          sheetObject
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: presentAbsentIndex + i, rowIndex: 1))
              .value = const TextCellValue("Present/Absent");

          //generating values to each fields

          sheetObject
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: 0, rowIndex: rowIndex + 1))
              .value = values[i]["studentName"];
          sheetObject
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: periodIndex + i, rowIndex: rowIndex + 1))
              .value = values[i]["periodName"];
          sheetObject
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: subjectNameIndex + i, rowIndex: rowIndex + 1))
              .value = values[i]["subjectName"];
          sheetObject
                  .cell(CellIndex.indexByColumnRow(
                      columnIndex: presentAbsentIndex + i,
                      rowIndex: rowIndex + 1))
                  .value =
              TextCellValue((values[i]["present"]) ? "Present" : "Absent");

          periodIndex = periodIndex + 2;
          subjectNameIndex = subjectNameIndex + 2;
          presentAbsentIndex = presentAbsentIndex + 2;
        }
        rowIndex++;

        ///resetting this data becuase next iteration is next student
        periodIndex = 1;
        subjectNameIndex = 2;
        presentAbsentIndex = 3;
      });
      excel.save(fileName: '${className}_${dayModel?.dDate ?? ""}.xlsx');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      showToast(msg: "Something went wrong");
      log(e.toString());
    }
  }

  Future<String> getClassName(String classId) async {
    final data =
        await firebaseFirestore.collection('classes').doc(classId).get();
    return data.data()?["className"] ?? " ";
  }
}