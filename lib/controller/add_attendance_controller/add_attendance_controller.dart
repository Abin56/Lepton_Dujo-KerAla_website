import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../model/create_classModel/add_student_model.dart';
import '../admin_login_screen/admin_login_screen_controller.dart';
import '../get_firebase-data/get_firebase_data.dart';

class AddAttendanceController extends GetxController {
  List<DateTime> disabledDates = [];
  RxBool isLoading = RxBool(false);

  RxList<String> studentsListToAdd = RxList([]);

  final _fireStore = FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(Get.find<AdminLoginScreenController>().schoolID)
      .collection(Get.find<GetFireBaseData>().bYear.value)
      .doc(Get.find<GetFireBaseData>().bYear.value)
      .collection('classes');

  Map<String, dynamic> selectClassData = {};
  Map<String, dynamic> selectedSubject = {};
  int selectedPeriod = 0;
  String selectMonthId = "";
  final Uuid uuid = const Uuid();

  List<int> periodLists = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  final TextEditingController dateTextController = TextEditingController();

  Future<List<Map<String, dynamic>>> fetchAllClass() async {
    final QuerySnapshot<Map<String, dynamic>> schoolLists =
        await _fireStore.get();
    return schoolLists.docs.map((e) => e.data()).toList();
  }

  Future<List<Map<String, dynamic>>> fetchAllMonths() async {
    final QuerySnapshot<Map<String, dynamic>> monthData = await _fireStore
        .doc(selectClassData["docid"])
        .collection("Attendence")
        .get();
    return monthData.docs.map((e) => e.data()).toList();
  }

  Future<void> fetchAllTakedAttendanceDate() async {
    try {
      final dateData = await _fireStore
          .doc(selectClassData["docid"])
          .collection("Attendence")
          .doc(selectMonthId)
          .collection(selectMonthId)
          .get();

      DateFormat dateFormat = DateFormat("dd-MM-yyyy");

      disabledDates = dateData.docs
          .map((e) => dateFormat.parse(e.data()["docid"]))
          .toList();
    } catch (e) {
      log(e.toString());
      showToast(msg: "Something went wrong");
    }
  }

  Future<void> callDatePicker({required BuildContext context}) async {
    try {
      await fetchAllTakedAttendanceDate();

      ///firebase month format is July-2023
      ///this format is converted to date format
      DateFormat inputFormat = DateFormat('MMMM-yyyy');
      DateTime dateTime = inputFormat.parseLoose(selectMonthId);

      DateTime firstDayOfMonth = DateTime(dateTime.year, dateTime.month);

      DateTime lastDayOfMonth = DateTime(dateTime.year, dateTime.month + 1, 0);

      ///dateTime.month + 1 is used to get the next month's number.
      /// Since dateTime.month represents the current month (January is 1,
      /// February is 2, and so on), adding 1 gives the number of the next month.

      /// The DateTime constructor is then used to create a new DateTime object
      ///  representing the first day of the next month.
      ///  We use DateTime(dateTime.year, dateTime.month + 1, 0):

      ///* dateTime.year: Represents the year component of the original
      /// DateTime object, which remains the same.

      ///*dateTime.month + 1: Represents the month component of the next month, as explained earlier.
      ///0: Represents the day component of the new DateTime object.
      /// By setting it to 0, we get the last day of the current month.
      ///  The reason this works is that when the day is set to 0,
      ///  it "rolls back" to the last day of the previous month.
      ///  This is because in DateTime objects, the day ranges from 1 to the number of days in the month,
      ///  and setting it to 0 effectively gives you the last day of the previous month.

      DateTime initialDates = firstDayOfMonth;
      if (context.mounted) {}

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDates,
        firstDate: firstDayOfMonth,
        lastDate: lastDayOfMonth,
      );
      if (picked != null) {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        String formatted = formatter.format(picked);
        dateTextController.text = formatted;
      }
    } catch (e) {
      showToast(msg: "Something went wrong");
      log(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllSubjects() async {
    final QuerySnapshot<Map<String, dynamic>> subjectData = await _fireStore
        .doc(selectClassData["docid"])
        .collection("subjects")
        .get();

    return subjectData.docs.map((e) => e.data()).toList();
  }

  Future<List<AddStudentModel>> fetchAllStudentsData() async {
    final studentData = await _fireStore
        .doc(selectClassData["docid"])
        .collection("Students")
        .get();

    return studentData.docs
        .map((e) => AddStudentModel.fromMap(e.data()))
        .toList();
  }

  Future<void> submitFunction() async {
    try {
      isLoading.value = true;
      //check this day is containing
      DateFormat inputFormat = DateFormat("dd-MM-yyyy");
      // Parse the date string to a DateTime object
      DateTime dateObject = inputFormat.parse(dateTextController.text);
      String formattedDateString = formatDate(dateObject);
      final allDays = await _fireStore
          .doc(selectClassData["docid"])
          .collection("Attendence")
          .doc(selectMonthId)
          .collection(selectMonthId)
          .get();
      final List<String> allDaysLists =
          allDays.docs.map((e) => e.data()["docid"] as String).toList();
      if (allDaysLists.contains(dateTextController.text)) {
        //fetch all periods and check this period contain inside that list show toast
        final allPeriods = await _fireStore
            .doc(selectClassData["docid"])
            .collection("Attendence")
            .doc(selectMonthId)
            .collection(selectMonthId)
            .doc(dateTextController.text)
            .collection("Subjects")
            .get();
        //extracting period from this data
        final List<String> periodLists =
            allPeriods.docs.map((e) => e.data()["period"] as String).toList();
        //checking period is already created
        if (periodLists.contains(selectedPeriod.toString())) {
          isLoading.value = false;
          return showToast(msg: "Period Already Created");
        } else {
          await createNewPeriodOnly();
          showToast(msg: "Sucessfully created");
        }
        isLoading.value = false;
      } else {
        await newDateFunction(
          dateObject: dateObject,
          formattedDateString: formattedDateString,
        );
        showToast(msg: "Sucessfully created");
        isLoading.value = false;
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }

  Future<void> newDateFunction(
      {required DateTime dateObject,
      required String formattedDateString}) async {
    List<Map<String, dynamic>> uploadingStudentsLists = [];
    List<AddStudentModel> studentsList = await fetchAllStudentsData();

    final String day = DateFormat('EEEE').format(dateObject);

    //creating new date
    await _fireStore
        .doc(selectClassData["docid"])
        .collection("Attendence")
        .doc(selectMonthId)
        .collection(selectMonthId)
        .doc(dateTextController.text)
        .set({
      "dDate": formattedDateString,
      "day": day,
      "docid": dateTextController.text,
    });
    final String id1 = uuid.v1() + selectedPeriod.toString();

    for (var studentObject in studentsList) {
      //if student list is not empty
      for (var studentId in studentsListToAdd) {
        if (studentId == studentObject.docid) {
          uploadingStudentsLists.add({
            "Date": DateTime.now().toString(),
            "present": true,
            "studentName": studentObject.studentName,
            "uid": studentObject.docid,
          });
        }
      }
      //this for that list not contain student id then it will be absent
      bool isContain1 = false;
      for (var studentObject in studentsList) {
        isContain1 = false;
        for (var element in uploadingStudentsLists) {
          if (element["uid"] == studentObject.docid) {
            isContain1 = true;
            break;
          }
        }
        if (!isContain1) {
          uploadingStudentsLists.add({
            "Date": DateTime.now().toString(),
            "present": false,
            "studentName": studentObject.studentName,
            "uid": studentObject.docid,
          });
        }
      }
    }

    //add all data to firebase inside [uploadingStudentsLists]

    for (var element in uploadingStudentsLists) {
      await _fireStore
          .doc(selectClassData["docid"])
          .collection("Attendence")
          .doc(selectMonthId)
          .collection(selectMonthId)
          .doc(dateTextController.text)
          .collection("Subjects")
          .doc(id1)
          .set({
        "date": DateTime.now().toString(),
        "docid": id1,
        "exTime": DateTime.now().toString(),
        "onSubmit": false,
        "period": selectedPeriod.toString(),
        "subject": selectedSubject["subjectName"],
      });

      await _fireStore
          .doc(selectClassData["docid"])
          .collection("Attendence")
          .doc(selectMonthId)
          .collection(selectMonthId)
          .doc(dateTextController.text)
          .collection("Subjects")
          .doc(id1)
          .collection("PresentList")
          .doc(element["uid"])
          .set(element);
    }
    uploadingStudentsLists.clear();
    studentsListToAdd.clear();
  }

  Future<void> createNewPeriodOnly() async {
    List<Map<String, dynamic>> uploadingStudentsLists = [];
    List<AddStudentModel> studentsList = await fetchAllStudentsData();
    for (var studentObject in studentsList) {
      //if student list is not empty
      for (var studentId in studentsListToAdd) {
        if (studentId == studentObject.docid) {
          uploadingStudentsLists.add({
            "Date": DateTime.now().toString(),
            "present": true,
            "studentName": studentObject.studentName,
            "uid": studentObject.docid,
          });
        }
      }
    }
    //this for that list not contain student id then it will be absent
    bool isContain1 = false;
    for (var studentObject in studentsList) {
      isContain1 = false;
      for (var element in uploadingStudentsLists) {
        if (element["uid"] == studentObject.docid) {
          isContain1 = true;
          break;
        }
      }
      if (!isContain1) {
        uploadingStudentsLists.add({
          "Date": DateTime.now().toString(),
          "present": false,
          "studentName": studentObject.studentName,
          "uid": studentObject.docid,
        });
      }
    }

    //add all data to firebase inside [uploadingStudentsLists]
    final String id1 = uuid.v1() + selectedPeriod.toString();

    for (var element in uploadingStudentsLists) {
      await _fireStore
          .doc(selectClassData["docid"])
          .collection("Attendence")
          .doc(selectMonthId)
          .collection(selectMonthId)
          .doc(dateTextController.text)
          .collection("Subjects")
          .doc(id1)
          .set({
        "date": DateTime.now().toString(),
        "docid": id1,
        "exTime": DateTime.now().toString(),
        "onSubmit": false,
        "period": selectedPeriod.toString(),
        "subject": selectedSubject["subjectName"],
      });

      await _fireStore
          .doc(selectClassData["docid"])
          .collection("Attendence")
          .doc(selectMonthId)
          .collection(selectMonthId)
          .doc(dateTextController.text)
          .collection("Subjects")
          .doc(id1)
          .collection("PresentList")
          .doc(element["uid"])
          .set(element);
    }
    uploadingStudentsLists.clear();
    studentsListToAdd.clear();
  }

  String formatDate(DateTime date) {
    // Create a custom format pattern to get the desired format
    final format = DateFormat("dd-MMMM-yyyy");
    return format.format(date);
  }
}
