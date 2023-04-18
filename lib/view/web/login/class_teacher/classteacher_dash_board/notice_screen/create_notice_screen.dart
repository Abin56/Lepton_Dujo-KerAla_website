import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/class_teacher/teacher_notice_controller.dart/teacher_notice_controller.dart';
import '../../../../../../model/class_teacher/class_teacher_notice_model.dart';
import '../../../../../constant/constant.dart';


class ClassTeacherCreateNoticePage extends StatelessWidget {
  ClassTeacherCreateNoticePage({
    super.key,
    required this.schoolId,
    required this.classId,
  });
  final String schoolId;
  final String classId;
  final TeacherNoticeController teacherNoticeController =
      Get.put(TeacherNoticeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    teacherNoticeController.clearControllers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Notice'),backgroundColor: adminePrimayColor,
        ),
        body: Obx(() {
          return teacherNoticeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  children: [
                    SizedBox(
                      width: size.width * .4,
                      height: size.height,
                      child: Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_wsdpcof3.json',
                          fit: BoxFit.fill),
                    ),
                    Container(
                       alignment: Alignment.center,
                        width: size.width * .6,
                        height: size.height,

                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * .4,
                        height: size.height,
                        child: Form(
                          child: ListView(
                            children: <Widget>[
                              const SizedBox(
                                height: 80,
                              ),
                              TextFormFieldWidget(
                                  hint: 'Heading',
                                  controller:
                                      teacherNoticeController.headingController),
                              sizedBoxH20,
                              TextFormFieldWidget(
                                  hint: 'Topic',
                                  controller:
                                      teacherNoticeController.topicController),
                              sizedBoxH20,
                              TextFormFieldWidget(
                                  hint: 'Content',
                                  controller:
                                      teacherNoticeController.contentController),
                              sizedBoxH20,
                              TextFormFieldWidget(
                                  hint: 'Signed By',
                                  controller:
                                      teacherNoticeController.signedByController),
                              sizedBoxH20,
                              TextFormFieldWidget(
                                  hint: 'Date',
                                  controller:
                                      teacherNoticeController.dateController),
                              sizedBoxH20,
                              Padding(
                                padding:  EdgeInsets.only(left: size.width/20,right: size.width/20),
                                child: Container(
                                  height: size.width/25,
                                  width: size.width/10,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: adminePrimayColor,
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () async {
                                        await teacherNoticeController.createNotice(
                                            schoolId: schoolId,
                                            classId: classId,
                                            classTeacherNoticeModel:
                                                ClassTeacherNoticeModel(
                                              heading: teacherNoticeController
                                                  .headingController.text,
                                              topic: teacherNoticeController
                                                  .topicController.text,
                                              content: teacherNoticeController
                                                  .contentController.text,
                                              signedBy: teacherNoticeController
                                                  .signedByController.text,
                                              date: teacherNoticeController
                                                  .dateController.text,
                                              noticeId: '',
                                            ));
                                      },
                                      child: const Text("Submit")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        }));
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key, this.hint = '', required this.controller});
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      controller: controller,
    );
  }
}
