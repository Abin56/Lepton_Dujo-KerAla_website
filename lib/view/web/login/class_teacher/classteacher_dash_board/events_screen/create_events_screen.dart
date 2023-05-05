import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';
import '../../../../../constant/constant.dart';

class ClassTeacherCreateEventsPage extends StatelessWidget {
  ClassTeacherCreateEventsPage({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final TeacherEventController teacherEventController =
      Get.put(TeacherEventController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   // teacherEventController.clearControllers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Events'),
          iconTheme: const IconThemeData(color: cBlack),
        ),
        body: Obx(() {
          return teacherEventController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(children: [
                  Row(
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
                          child: SizedBox(
                            width: size.width * .4,
                            child: Form(
                              key: formKey,
                              child: ListView(
                                children: <Widget>[
                                  sizedBoxH20,
                                  TextFormFieldWidget(
                                    function: checkFieldEmpty,
                                    hint: 'Event Name',
                                    controller:
                                        teacherEventController.nameController,
                                  ),
                                  sizedBoxH20,
                                  TextFormFieldWidget(
                                    function: checkFieldEmpty,
                                    hint: 'Event date',
                                    controller:
                                        teacherEventController.dateController,
                                  ),
                                  sizedBoxH20,
                                  TextFormFieldWidget(
                                    function: checkFieldEmpty,
                                    hint: 'Event Description',
                                    controller: teacherEventController
                                        .descriptionController,
                                  ),
                                  sizedBoxH20,
                                  TextFormFieldWidget(
                                    function: checkFieldEmpty,
                                    hint: 'Venue',
                                    controller:
                                        teacherEventController.venueController,
                                  ),
                                  sizedBoxH20,
                                  TextFormFieldWidget(
                                      function: checkFieldEmpty,
                                      hint: 'Chief Guest',
                                      controller: teacherEventController
                                          .chiefGuestController),
                                  sizedBoxH20,
                                  TextFormFieldWidget(
                                      function: checkFieldEmpty,
                                      hint: 'Participants',
                                      controller: teacherEventController
                                          .participantsController),
                                  sizedBoxH20,
                                  teacherEventController.image != null
                                      ? const Text(
                                          'Image Uploaded Successfully')
                                      : TextButton(
                                          onPressed: () async {
                                            // await teacherEventController
                                            //     .selectImage();
                                          },
                                          child: const Text('Upload Image'),
                                        ),
                                  sizedBoxH20,
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 50.w, right: 50.w, top: 30.h),
                                    child: SizedBox(
                                      height: 60.h,
                                      width: 250.w,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: adminePrimayColor,
                                            shape: const StadiumBorder(),
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState
                                                    ?.validate() ??
                                                false) {}
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
                  ),
                ]);
        }));
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.hint = '',
      required this.controller,
      required this.function});
  final String hint;
  final String? Function(String? fieldContent) function;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: function,
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
