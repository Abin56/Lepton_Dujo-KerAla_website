import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/class_teacher/teacher_notice_controller.dart/teacher_notice_controller.dart';
import '../../../../../../../model/class_teacher/class_teacher_notice_model.dart';
import '../../../../../../constant/constant.dart';

class ClassTeacherNoticeShow extends StatelessWidget {
  ClassTeacherNoticeShow(
      {super.key,
      required this.schoolId,
      required this.classId,
      required this.classTeacherNoticeModel});
  final String schoolId;
  final String classId;
  final TeacherNoticeController teacherNoticeController =
      Get.put(TeacherNoticeController());
  final ClassTeacherNoticeModel classTeacherNoticeModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    addTextToController();
    return Obx(() {
      return SizedBox(
        width: size.width / 3,
        height: size.height,
        child: teacherNoticeController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      TextFormFieldWidget(
                          hint: 'Heading',
                          controller:
                              teacherNoticeController.headingController),
                      sizedBoxH20,
                      TextFormFieldWidget(
                          hint: 'Topic',
                          controller: teacherNoticeController.topicController),
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
                          controller: teacherNoticeController.dateController),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () async {
                          teacherNoticeController.updateNotice(
                            schoolId: schoolId,
                            classId: classId,
                            classTeacherNoticeModel: ClassTeacherNoticeModel(
                              heading: teacherNoticeController
                                  .headingController.text,
                              topic:
                                  teacherNoticeController.topicController.text,
                              content: teacherNoticeController
                                  .contentController.text,
                              signedBy: teacherNoticeController
                                  .signedByController.text,
                              date: teacherNoticeController.dateController.text,
                              noticeId: classTeacherNoticeModel.noticeId,
                            ),
                            documentId: classTeacherNoticeModel.noticeId,
                            context: context,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Update",
                        ),
                      )
                    ],
                  ),
                ),
              ),
      );
    });
  }

  void addTextToController() {
    teacherNoticeController.headingController.text =
        classTeacherNoticeModel.heading;
    teacherNoticeController.topicController.text =
        classTeacherNoticeModel.topic;
    teacherNoticeController.contentController.text =
        classTeacherNoticeModel.content;
    teacherNoticeController.signedByController.text =
        classTeacherNoticeModel.signedBy;
    teacherNoticeController.dateController.text = classTeacherNoticeModel.date;
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
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
    );
  }
}
