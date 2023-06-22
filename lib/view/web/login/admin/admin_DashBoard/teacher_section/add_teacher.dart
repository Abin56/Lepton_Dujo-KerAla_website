// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dujo_kerala_website/controller/teacher_controller/teacher_controller.dart';
import 'package:dujo_kerala_website/view/web/widgets/Iconbackbutton.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../model/teacher/teacher_model.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../colors/colors.dart';
import '../../../../../constant/constant.dart';
import '../../../../../fonts/fonts.dart';

class AddTeacherSectionScreen extends StatelessWidget {
  final String schoolID;
  final TeacherController teacherController = Get.put(TeacherController());

  AddTeacherSectionScreen({super.key, required this.schoolID});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              color: adminePrimayColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButtonBackWidget(
                    color: cWhite,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ! Admin',
                          style: ralewayStyle.copyWith(
                            fontSize: 45.0.w,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        sizedBoxH30,
                        Text(
                          'Create Teacher Profile',
                          style: ralewayStyle.copyWith(
                            fontSize: 26.0.w,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: screenSize.width / 2,
                          child: LottieBuilder.network(
                              'https://assets5.lottiefiles.com/packages/lf20_ikvz7qhc.json'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height,
              width: screenSize.width * 1 / 2,
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreateTeacherTextInputFieldWidget(
                        labelText: "Name",
                        textEditingController: teacherController.nameController,
                        validator: checkFieldEmpty,
                      ),
                      CreateTeacherTextInputFieldWidget(
                        labelText: "Phone number",
                        textEditingController:
                            teacherController.phoneNumberController,
                        validator: checkFieldPhoneNumberIsValid,
                      ),
                      CreateTeacherTextInputFieldWidget(
                        labelText: "Employee ID",
                        textEditingController:
                            teacherController.employeeIDController,
                        validator: checkFieldEmpty,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 100, right: 100),
                              child: SizedBox(
                                height: 40,
                                child: Obx(
                                  () => teacherController.isLoading.value
                                      ? circularProgressIndicator
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 39, 68),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              final teacher = TeacherModel(
                                                teacherName: teacherController
                                                    .nameController.text,
                                                employeeID: teacherController
                                                    .employeeIDController.text,
                                                createdAt:
                                                    DateTime.now().toString(),
                                                teacherPhNo: teacherController
                                                    .phoneNumberController.text,
                                                userRole: 'teacher',
                                              );
                                              teacherController
                                                  .createNewTeacher(teacher);
                                            }
                                          },
                                          child: const Text('Add teacher'),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Obx(() => teacherController.isLoading.value
                              ? circularProgressIndicator
                              : Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 10,
                                        left: 60,
                                        right: 60),
                                    child: Column(
                                      children: [
                                        sizedBoxH30,
                                        SizedBox(
                                          height: 40,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 3, 39, 68),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            onPressed: () async {
                                              await teacherExcelFunction();
                                            },
                                            child:
                                                Text('Upload data from excel'),
                                          ),
                                        ),
                                        sizedBoxH10,
                                        Text(
                                           "* Please use .xlsx format",
                                           style: TextStyle(
                                          fontSize: 13.w,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 27, 106, 170)),
                                          ),
                                        
                                      ],
                                    ),
                                  ),
                                )),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> teacherExcelFunction() async {
    //extract excel data
    final result = await extractDataFromExcel();
    teacherController.isLoading.value = true;
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
              teacherController.createNewTeacher(TeacherModel(
                teacherName: firstRow[0]?.value.toString(),
                employeeID: firstRow[1]?.value.toString(),
                createdAt: DateTime.now().toString(),
                teacherPhNo: firstRow[2]?.value.toString(),
                userRole: 'teacher',
              ));
            }
          }
          teacherController.isLoading.value = false;
        } else {
          teacherController.isLoading.value = false;
          showToast(msg: 'Empty Sheet');
        }
      }
    }
    teacherController.isLoading.value = false;
  }
}

class CreateTeacherTextInputFieldWidget extends StatelessWidget {
  const CreateTeacherTextInputFieldWidget({
    super.key,
    required this.labelText,
    required this.textEditingController,
    this.validator,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10, bottom: 10, left: 100, right: 100),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
