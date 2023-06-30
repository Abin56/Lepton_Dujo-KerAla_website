import 'package:dujo_kerala_website/utils/utils.dart';
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

  });

  final formKey = GlobalKey<FormState>();

  final TeacherNoticeController teacherNoticeController =
      Get.put(TeacherNoticeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    teacherNoticeController.clearControllers();
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Create New Notice'),
          backgroundColor: adminePrimayColor,
          iconTheme: const IconThemeData(color: cWhite),
        ),
        body: SafeArea(
          child: Row(
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
                    key: formKey,
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 80,
                        ),
                        TextFormFieldWidget(
                            validator: checkFieldEmpty,
                            hint: 'Heading',
                            controller:
                                teacherNoticeController.headingController),
                        sizedBoxH20,
                        TextFormFieldWidget(
                            validator: checkFieldEmpty,
                            hint: 'Topic',
                            controller: teacherNoticeController.topicController),
                        sizedBoxH20,
                        TextFormFieldWidget(
                            validator: checkFieldEmpty,
                            hint: 'Content',
                            controller:
                                teacherNoticeController.contentController),
                        sizedBoxH20,
                        TextFormFieldWidget(
                            validator: checkFieldEmpty,
                            hint: 'Signed by',
                            controller:
                                teacherNoticeController.signedByController),
                        sizedBoxH20,
                        TextFormFieldWidget(
                          validator: checkFieldEmpty,
                          hint: 'Date',
                          controller: teacherNoticeController.dateController,
                          onTap: () async => teacherNoticeController
                              .dateController
                              .text = await dateTimePicker(context),
                          readOnly: true,
                        ),
                        sizedBoxH20,
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width / 20, right: size.width / 20),
                          child: SizedBox(
                            height: size.width / 25,
                            width: size.width / 10,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: adminePrimayColor,
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await teacherNoticeController.createNotice(
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
                                      docid: '',
                                    ));
                                  }
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
          ),
        ));
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.hint = '',
      required this.validator,
      required this.controller,
      this.onTap,
      this.readOnly = false});
  final String hint;
  final String? Function(String? fieldContent) validator;
  final TextEditingController controller;
  final void Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      validator: validator,
      onTap: onTap,
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
