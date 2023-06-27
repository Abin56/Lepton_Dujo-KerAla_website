import 'package:dujo_kerala_website/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/class_teacher/teacher_notice_controller.dart/teacher_notice_controller.dart';
import '../../../../../../../model/class_teacher/class_teacher_notice_model.dart';
import '../../../../../../constant/constant.dart';

class ClassTeacherNoticeShow extends StatelessWidget {
  ClassTeacherNoticeShow({super.key, required this.classTeacherNoticeModel});
  final TeacherNoticeController teacherNoticeController =
      Get.put(TeacherNoticeController());
  final ClassTeacherNoticeModel classTeacherNoticeModel;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  key: formKey,
                  child: ListView(
                    children: <Widget>[
                      TextFormFieldWidget(
                        hint: 'Heading',
                        controller: teacherNoticeController.headingController,
                        validator: checkFieldEmpty,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Topic',
                        controller: teacherNoticeController.topicController,
                        validator: checkFieldEmpty,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Content',
                        controller: teacherNoticeController.contentController,
                        validator: checkFieldEmpty,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Signed by',
                        controller: teacherNoticeController.signedByController,
                        validator: checkFieldEmpty,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Date',
                        controller: teacherNoticeController.dateController,
                        validator: checkFieldEmpty,
                        onTap: () async => teacherNoticeController
                            .dateController
                            .text = await dateTimePicker(context),
                        readOnly: true,
                      ),
                      sizedBoxH20,
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              teacherNoticeController.updateNotice(
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
                                  docid: classTeacherNoticeModel.docid,
                                ),
                                documentId: classTeacherNoticeModel.docid,
                                context: context,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                          ),
                          child: Obx(
                            () => teacherNoticeController.isLoading.value
                                ? circularProgressIndicator
                                : const Text(
                                    "Update",
                                  ),
                          ))
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
      {super.key,
      this.hint = '',
      required this.controller,
      this.validator,
      this.onTap,
      this.readOnly = false});
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
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
