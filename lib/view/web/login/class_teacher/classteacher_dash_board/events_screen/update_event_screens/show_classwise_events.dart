import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';
import '../../../../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../../../constant/constant.dart';

class ClassTeacherEventShow extends StatelessWidget {
  ClassTeacherEventShow({
    super.key,
    required this.classTeacherEventModel,
  });
  final TeacherEventController teacherEventController =
      Get.put(TeacherEventController());
  final ClassTeacherEventModel classTeacherEventModel;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    addTextToController();
    return Obx(
      () {
        return SizedBox(
          width: size.width / 3,
          height: size.height,
          child: teacherEventController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: <Widget>[
                        TextFormFieldWidget(
                          hint: 'Event Name',
                          controller: teacherEventController.nameController,
                          validator: checkFieldEmpty,
                        ),
                        sizedBoxH20,
                        TextFormFieldWidget(
                          hint: 'Event date',
                          controller: teacherEventController.dateController,
                          validator: checkFieldEmpty,
                        ),
                        sizedBoxH20,
                        TextFormFieldWidget(
                          hint: 'Event Description',
                          controller:
                              teacherEventController.descriptionController,
                          validator: checkFieldEmpty,
                        ),
                        sizedBoxH20,
                        TextFormFieldWidget(
                          hint: 'Venue',
                          controller: teacherEventController.venueController,
                          validator: checkFieldEmpty,
                        ),
                        sizedBoxH20,
                        TextFormFieldWidget(
                          hint: 'Signed by',
                          controller: teacherEventController.signedByController,
                          validator: checkFieldEmpty,
                        ),
                        sizedBoxH20,
                        TextButton(
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              //creatin event model
                              final eventModel = ClassTeacherEventModel(
                                  eventDate: teacherEventController
                                      .dateController.text,
                                  eventDescription: teacherEventController
                                      .descriptionController.text,
                                  eventName: teacherEventController
                                      .nameController.text,
                                  docid: classTeacherEventModel.docid,
                                  signedBy: teacherEventController
                                      .signedByController.text,
                                  venue: teacherEventController
                                      .venueController.text);

                              //update data to firebase
                              teacherEventController.updateEvent(
                                  classTeacherEventModel: eventModel,
                                  documentId: classTeacherEventModel.docid,
                                  context: context);
                            }
                          },
                          child: Obx(
                            () => teacherEventController.isLoading.value
                                ? circularProgressIndicator
                                : const Text(
                                    "Update",
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  void addTextToController() {
    teacherEventController.nameController.text =
        classTeacherEventModel.eventName;
    teacherEventController.dateController.text =
        classTeacherEventModel.eventDate;
    teacherEventController.descriptionController.text =
        classTeacherEventModel.eventDescription;
    teacherEventController.venueController.text = classTeacherEventModel.venue;

    teacherEventController.signedByController.text =
        classTeacherEventModel.signedBy;
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key, this.hint = '', required this.controller, this.validator});
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
