import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/create_classModel/add_student_model.dart';
import '../../../../utils/utils.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';
import '../../../get_firebase-data/get_firebase_data.dart';

class TeacherAddStudentController extends GetxController {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController parentPhNoController = TextEditingController();
  TextEditingController addmissionNumberController = TextEditingController();
  RxBool isLoading = RxBool(false);

  DocumentReference<Map<String, dynamic>> firebaseFirestore = FirebaseFirestore
      .instance
      .collection('SchoolListCollection')
      .doc(Get.find<AdminLoginScreenController>().schoolID);

  Future<void> createStudent({required studentModel}) async {
    try {
      isLoading.value = true;

      await firebaseFirestore
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection("classes")
          .doc(Get.find<GetFireBaseData>().classIDD.value)
          .collection('TempStudents')
          .add(studentModel.toMap())
          .then((value) async {
        await firebaseFirestore
            .collection(Get.find<GetFireBaseData>().bYear.value)
            .doc(Get.find<GetFireBaseData>().bYear.value)
            .collection("classes")
            .doc(Get.find<GetFireBaseData>().classIDD.value)
            .collection('TempStudents')
            .doc(value.id)
            .update({"docid": value.id});
        studentNameController.clear();
        parentPhNoController.clear();
        addmissionNumberController.clear();
      });

      showToast(msg: "Successfully Created");
      isLoading.value = false;
    } catch (e) {
      showToast(msg: 'Student Creation Failed');
      isLoading.value = false;
    }
  }

//creat student from excel
  Future<void> studentExcelFunction() async {
    //extract excel data
    final result = await extractDataFromExcel();
    isLoading.value = true;
    if (result != null) {
      if (result.tables.isNotEmpty) {
        Sheet? table = result.tables[result.tables.keys.first];
        if (table != null) {
          for (int i = 1; i < table.maxRows; i++) {
            List<Data?>? firstRow = table.rows[i];
//fetching data from excel cells
            if (firstRow[0]?.value != null &&
                firstRow[1]?.value != null &&
                firstRow[2]?.value != null) {
              //creating objects and upload to firebase
              createStudent(
                  studentModel: AddStudentModel(
                studentName: firstRow[0]?.value.toString(),
                parentPhoneNumber: firstRow[1]?.value.toString(),
                admissionNumber: firstRow[2]?.value.toString(),
                classID: Get.find<GetFireBaseData>().classIDD.value,
                createDate: DateTime.now().toString(),
              ));
            }
          }
          isLoading.value = false;
        } else {
          isLoading.value = false;
          showToast(msg: 'Empty Sheet');
        }
      }
    }
    isLoading.value = false;
  }
}
