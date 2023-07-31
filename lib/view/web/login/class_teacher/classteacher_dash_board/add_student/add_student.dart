import 'package:dujo_kerala_website/controller/add_students_from_class/add_students_class_controller.dart';
import 'package:dujo_kerala_website/model/temp_student_model/temp_student_model.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/class_teacher/teacher_add_student_controller/teacher_add_student_controller.dart';
import '../../../../../../controller/admin_login_screen/admin_login_screen_controller.dart';
import '../../../../../../controller/get_firebase-data/get_firebase_data.dart';
import '../../../../../../utils/utils.dart';

class AddStudentFromClassTeacher extends StatelessWidget {
  AddStudentsFromClassController addStudentsFromClassController =
      Get.put(AddStudentsFromClassController());
  final String schoolID;
  final String teacherIDE;

  AddStudentFromClassTeacher({
    required this.schoolID,
    required this.teacherIDE,
    super.key,
  });

  final TeacherAddStudentController teacherAddStudentController =
      Get.put(TeacherAddStudentController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        Row(
          children: [
            Container(
              color: adminePrimayColor,
              height: size.height,
              width: size.width * 1 / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizedBoxH40,
                      Text(
                        'Hi ! Class teacher ',
                        style: ralewayStyle.copyWith(
                          fontSize: 40.0.w,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: size.width / 20,
                      ),
                      Text(
                        'Add Your Student',
                        style: ralewayStyle.copyWith(
                          fontSize: 25.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: size.width / 5,
                        width: size.width / 2,
                        child: LottieBuilder.network(
                            'https://assets8.lottiefiles.com/packages/lf20_ehs7xawx.json'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 1 / 2,
              height: size.height,
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h),
                    color: Colors.transparent,
                    height: size.width * 1 / 2.5,
                    width: size.width * 1 / 4,
                    child: Form(
                      key: formKey,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: checkFieldEmpty,
                            controller: teacherAddStudentController
                                .studentNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: checkFieldPhoneNumberIsValid,
                            controller: teacherAddStudentController
                                .parentPhNoController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Parent phone number',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: checkFieldEmpty,
                            controller: teacherAddStudentController
                                .addmissionNumberController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Admission number',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 50.w, right: 50.w, top: 30.h),
                          child: SizedBox(
                            height: 60.h,
                            width: 250.w,
                            child: Obx(() => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: adminePrimayColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      teacherAddStudentController.createStudent(
                                          studentModel: TempStudent(
                                            parentName: "",
                                            docid: "",
                                        studentName: teacherAddStudentController
                                            .studentNameController.text,
                                        parentPhoneNumber:
                                            teacherAddStudentController
                                                .parentPhNoController.text,
                                        admissionNumber:
                                            teacherAddStudentController
                                                .addmissionNumberController
                                                .text,
                                        classid: Get.find<GetFireBaseData>()
                                            .classIDD
                                            .value,
                                        createdDate: DateTime.now().toString(),
                                      ));
                                    }
                                  },
                                  child: teacherAddStudentController
                                          .isLoading.value
                                      ? circularProgressIndicator
                                      : const Text("Create"),
                                )),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 50.w, right: 50.w, top: 30.h),
                              child: SizedBox(
                                height: 60.h,
                                width: 250.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: adminePrimayColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    addStudentsFromClassController
                                        .addStudentsFromClass(
                                            context,
                                            Get.find<
                                                    AdminLoginScreenController>()
                                                .schoolID,
                                            Get.find<GetFireBaseData>()
                                                .bYear
                                                .value,
                                            Get.find<GetFireBaseData>()
                                                .classIDD
                                                .value);
                                  },
                                  child: const Text("Select Class"),
                                ),
                              ),
                            ),
                            sizedBoxH10,
                            Text(
                              "* Add Students from classes",
                              style: TextStyle(
                                  fontSize: 13.w,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 27, 106, 170)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 50.w, right: 50.w, top: 30.h),
                              child: SizedBox(
                                height: 60.h,
                                width: 250.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: adminePrimayColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await teacherExcelFunction();
                                  },
                                  child: const Text("Upload data from excel"),
                                ),
                              ),
                            ),
                            sizedBoxH10,
                            Text(
                              "* Please use .xlsx format",
                              style: TextStyle(
                                  fontSize: 13.w,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 27, 106, 170)),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Future<void> teacherExcelFunction() async {
    //extract excel data
    final result = await extractDataFromExcel();
    teacherAddStudentController.isLoading.value = true;
    if (result != null) {
      if (result.tables.isNotEmpty) {
        Sheet? table = result.tables[result.tables.keys.first];
        if (table != null) {
          for (int i = 1; i < table.maxRows; i++) {
            List<Data?>? firstRow = table.rows[i];
//fetching data from excel cells
            if (firstRow[0]?.value != null &&
                firstRow[1]?.value != null &&
                firstRow[2]?.value != null &&
                firstRow[3]?.value != null) {
              //creating objects and upload to firebase
              teacherAddStudentController.createStudent(
                  studentModel: TempStudent(
                      studentName: firstRow[0]?.value.toString() ?? "",
                      parentPhoneNumber: firstRow[1]?.value.toString() ?? "",
                      admissionNumber: firstRow[2]?.value.toString() ?? "",
                      classid: Get.find<GetFireBaseData>().classIDD.value,
                      createdDate: DateTime.now().toString(),
                      parentName: firstRow[3]?.value.toString() ?? "",
                      docid: ""));
            }
          }
          teacherAddStudentController.isLoading.value = false;
        } else {
          teacherAddStudentController.isLoading.value = false;
          showToast(msg: 'Empty Sheet');
        }
      }
    }
    teacherAddStudentController.isLoading.value = false;
  }
}
