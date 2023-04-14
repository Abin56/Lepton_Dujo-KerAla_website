import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';
import '../../../../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../../../constant/constant.dart';

class ClassTeacherEventShow extends StatelessWidget {
  ClassTeacherEventShow({
    super.key,
    required this.schoolId,
    required this.classId,
    required this.classTeacherEventModel,
  });
  final String schoolId;
  final String classId;
  final TeacherEventController teacherEventController =
      Get.put(TeacherEventController());
  final ClassTeacherEventModel classTeacherEventModel;
  String imageUrl = '';

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
                  child: ListView(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                      TextFormFieldWidget(
                        hint: 'Event Name',
                        controller: teacherEventController.nameController,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Event date',
                        controller: teacherEventController.dateController,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Event Description',
                        controller:
                            teacherEventController.descriptionController,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Venue',
                        controller: teacherEventController.venueController,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Chief Guest',
                        controller: teacherEventController.chiefGuestController,
                      ),
                      sizedBoxH20,
                      TextFormFieldWidget(
                        hint: 'Participants',
                        controller:
                            teacherEventController.participantsController,
                      ),
                      sizedBoxH20,
                      imageUrl.isNotEmpty
                          ? const Text('Image Updated Successfully')
                          : teacherEventController.isImageUpload.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : TextButton(
                                  onPressed: () async {
                                    imageUrl = await teacherEventController
                                        .eventPhotoUpdate(
                                      uid: classTeacherEventModel.image,
                                    );
                                  },
                                  child: const Text('Upload Image'),
                                ),
                      sizedBoxH20,
                      ElevatedButton(
                        onPressed: () async {
                          // imageUrl = '';
                          // imageUrl =
                          //     await teacherEventController.eventPhotoUpdate(
                          //         uid: classTeacherEventModel.imageUid);
                          if (context.mounted) {
                            teacherEventController.updateEvent(
                                schoolId: schoolId,
                                classId: classId,
                                classTeacherEventModel: ClassTeacherEventModel(
                                    eventId: classTeacherEventModel.eventId,
                                    eventName: teacherEventController
                                        .nameController.text,
                                    eventDate: teacherEventController
                                        .dateController.text,
                                    description: teacherEventController
                                        .descriptionController.text,
                                    venue: teacherEventController
                                        .venueController.text,
                                    chiefGuest: teacherEventController
                                        .chiefGuestController.text,
                                    participants: teacherEventController
                                        .participantsController.text,
                                    image: imageUrl,
                                    imageUid: classTeacherEventModel.imageUid),
                                documentId: classTeacherEventModel.eventId,
                                context: context);
                          }
                        },
                        child: const Text(
                          "Update",
                        ),
                      )
                    ],
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
        classTeacherEventModel.description;
    teacherEventController.venueController.text = classTeacherEventModel.venue;
    teacherEventController.chiefGuestController.text =
        classTeacherEventModel.chiefGuest;
    teacherEventController.participantsController.text =
        classTeacherEventModel.participants;
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
