import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';
import '../../../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../../constant/constant.dart';


class ClassTeacherCreateEventsPage extends StatelessWidget {
  ClassTeacherCreateEventsPage({
    super.key,
    required this.schoolId,
    required this.classId,
  });
  final String schoolId;
  final String classId;
  final TeacherEventController teacherEventController =
      Get.put(TeacherEventController());
  Map<String, String> imageDataMap = <String, String>{};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    teacherEventController.clearControllers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Events'),backgroundColor: adminePrimayColor,
        ),
        body: Obx(() {
          return teacherEventController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  children: [
                    SizedBox(
                      width: size.width * .4,
                      height: size.height,
                      child: Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_qrtp2d9r.json',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      width: size.width * .6,
                        height: size.height,
                         alignment: Alignment.center,

                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                           width: size.width * .4,
                          
                          child: Form(
                            child: ListView(
                              children: <Widget>[
                                sizedBoxH20,
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
                                  controller:
                                      teacherEventController.venueController,
                                ),
                                sizedBoxH20,
                                TextFormFieldWidget(
                                    hint: 'Chief Guest',
                                    controller: teacherEventController
                                        .chiefGuestController),
                                sizedBoxH20,
                                TextFormFieldWidget(
                                    hint: 'Participants',
                                    controller: teacherEventController
                                        .participantsController),
                                sizedBoxH20,
                                imageDataMap.isNotEmpty
                                    ? const Text('Image Uploaded Successfully')
                                    : teacherEventController.isImageUpload.value
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : TextButton(
                                            onPressed: () async {
                                              imageDataMap =
                                                  await teacherEventController
                                                      .eventPhotoUpload();
                                            },
                                            child: const Text('Upload Image'),
                                          ),
                                sizedBoxH20,
                                Padding(
                                  padding:  EdgeInsets.only(left: size.width/20,right: size.width/20),
                                  child: Container(
                                    height: size.width/25,
                                    width: size.width/15,
                                    child: ElevatedButton(
                                    
                                        style: ElevatedButton.styleFrom(backgroundColor: adminePrimayColor,
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () async {
                                          await teacherEventController.createEvents(
                                            schoolId: schoolId,
                                            classId: classId,
                                            classTeacherEventModel: ClassTeacherEventModel(
                                                eventId: '',
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
                                                image: imageDataMap['downloadUrl']!,
                                                imageUid: imageDataMap['imageUid']!),
                                          );
                                          imageDataMap = {};
                                        },
                                        child: const Text("Submit")),
                                  ),
                                )
                              ],
                            ),
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
