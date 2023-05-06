// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../../../controller/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';
// import '../../../../../../../model/class_teacher/class_teacher_event_model.dart';
// import '../../../../../../constant/constant.dart';

// class ClassTeacherEventShow extends StatelessWidget {
//   ClassTeacherEventShow({
//     super.key,
//     required this.schoolId,
//     required this.classId,
//     required this.classTeacherEventModel,
//   });
//   final String schoolId;
//   final String classId;
//   final TeacherEventController teacherEventController =
//       Get.put(TeacherEventController());
//   final ClassTeacherEventModel classTeacherEventModel;
//   String imageUrl = '';

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     addTextToController();
//     return Obx(
//       () {
//         return SizedBox(
//           width: size.width / 3,
//           height: size.height,
//           child: teacherEventController.isLoading.value
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Form(
//                   child: ListView(
//                     children: <Widget>[
//                       IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         icon: const Icon(Icons.close),
//                       ),
//                       TextFormFieldWidget(
//                         hint: 'Event Name',
//                         controller: teacherEventController.nameController,
//                       ),
//                       sizedBoxH20,
//                       TextFormFieldWidget(
//                         hint: 'Event date',
//                         controller: teacherEventController.dateController,
//                       ),
//                       sizedBoxH20,
//                       TextFormFieldWidget(
//                         hint: 'Event Description',
//                         controller:
//                             teacherEventController.descriptionController,
//                       ),
//                       sizedBoxH20,
//                       TextFormFieldWidget(
//                         hint: 'Venue',
//                         controller: teacherEventController.venueController,
//                       ),
//                       sizedBoxH20,
//                       sizedBoxH20,
//                       TextFormFieldWidget(
//                         hint: 'Signed By',
//                         controller: teacherEventController.signedByController,
//                       ),
//                       sizedBoxH20,
//                       sizedBoxH20,
//                       ElevatedButton(
//                         onPressed: () async {
//                           if (context.mounted) {}
//                         },
//                         child: const Text(
//                           "Update",
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//         );
//       },
//     );
//   }

//   void addTextToController() {
//     teacherEventController.nameController.text =
//         classTeacherEventModel.eventName;
//     teacherEventController.dateController.text =
//         classTeacherEventModel.eventDate;
//     teacherEventController.descriptionController.text =
//         classTeacherEventModel.description;
//     teacherEventController.venueController.text = classTeacherEventModel.venue;

//     teacherEventController.signedByController.text =
//         classTeacherEventModel.participants;
//   }
// }

// class TextFormFieldWidget extends StatelessWidget {
//   const TextFormFieldWidget(
//       {super.key, this.hint = '', required this.controller});
//   final String hint;
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       controller: controller,
//     );
//   }
// }
