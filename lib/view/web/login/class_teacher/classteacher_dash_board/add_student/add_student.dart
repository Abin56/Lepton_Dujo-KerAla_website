import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:dujo_kerala_website/view/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../controller/Getx/class_teacher/teacher_add_student_controller/teacher_add_student_controller.dart';

class AddStudentFromClassTeacher extends StatelessWidget {
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
                      Text(
                        'Hi Admin ',
                        style: ralewayStyle.copyWith(
                          fontSize: 48.0,
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
                              labelText: 'Guardian Phone Number',
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
                              labelText: 'AdmissionNumber',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                        teacherAddStudentController
                                            .createStudent();
                                      }
                                    },
                                    child: teacherAddStudentController
                                            .isLoading.value
                                        ? circularProgressIndicator
                                        : const Text("Create"),
                                  )),
                            ),
                          ),
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
}
