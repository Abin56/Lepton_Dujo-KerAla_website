import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../utils/utils.dart';
import '../../../../view/constant/constant.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';
import '../../../get_firebase-data/get_firebase_data.dart';

class TeacherEventController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController chiefGuestController = TextEditingController();
  final TextEditingController participantsController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<ClassTeacherEventModel> classTeacherEventModelData =
      Rxn<ClassTeacherEventModel>(null);
  Uint8List? image;

  // final firebaseFirestore = FirebaseFirestore.instance
  //     .collection('SchoolListCollection')
  //     .doc(Get.find<AdminLoginScreenController>().schoolID)
  //     .collection(Get.find<GetFireBaseData>().bYear.value)
  //     .doc(Get.find<GetFireBaseData>().bYear.value)
  //     .collection('classes')
  //     .doc(Get.find<GetFireBaseData>().classIDD.value)
  //     .collection('events');
  // //create events

  // Future<void> createEvents() async {
  //   //creating new event

  //   try {
  //     isLoading.value = true;
  //     String uid = "";
  //     String imageUrl = "";

  //     if (image != null) {
  //       uid = const Uuid().v1();
  //       FirebaseStorage.instance
  //           .ref()
  //           .child("files/events/$uid")
  //           .putData(image!)
  //           .then((p0) async {
  //         return imageUrl = await p0.ref.getDownloadURL();
  //       });
  //     }

  //     final classTeacherEventModel = ClassTeacherEventModel(
  //       eventId: "",
  //       eventName: nameController.text,
  //       eventDate: dateController.text,
  //       description: descriptionController.text,
  //       venue: venueController.text,
  //       chiefGuest: chiefGuestController.text,
  //       participants: participantsController.text,
  //       imageUrl: imageUrl,
  //       imageUid: uid,
  //     );
  //     await firebaseFirestore
  //         .add(
  //       classTeacherEventModel.toMap(),
  //     )
  //         .then((value) async {
  //       //updating document id to firebase
  //       await firebaseFirestore.doc(value.id).update({
  //         "eventId": value.id,
  //       });
  //     });
  //     clearControllers();
  //     isLoading.value = false;
  //     showToast(msg: 'Successfully Creted');
  //   } catch (e) {
  //     showToast(msg: e.toString());
  //   }
  // }

  // Future<void> selectImage() async {
  //   image = await pickImage(ImageSource.gallery);
  // }

  // Future<void> updateEvent(
  //     {required ClassTeacherEventModel classTeacherEventModel,
  //     required String documentId,
  //     required BuildContext context}) async {
  //   try {
  //     isLoading.value = true;
  //     await firebaseFirestore.doc(documentId).update(
  //           classTeacherEventModel.toMap(),
  //         );
  //     clearControllers();
  //     isLoading.value = false;
  //     classTeacherEventModelData.value = null;
  //     showToast(msg: 'Successfully Updated');
  //     if (context.mounted) {
  //       Navigator.of(context).pop();
  //     }
  //   } catch (e) {
  //     showToast(
  //       msg: e.toString(),
  //     );
  //   }
  // }

  // Future<void> deleteEvent(
  //     {required String documentId,
  //     required String imageId,
  //     required BuildContext context}) async {
  //   try {
  //     await firebaseFirestore.doc(documentId).delete().then((value) {
  //       FirebaseStorage.instance.ref().child('files/events/$imageId').delete();
  //       classTeacherEventModelData.value = null;
  //       showToast(msg: 'Successfully Removed');
  //     });

  //     if (context.mounted) {
  //       Navigator.of(context).pop();
  //     }
  //   } catch (e) {
  //     showToast(msg: e.toString());
  //   }
  // }

  // void clearControllers() {
  //   nameController.clear();
  //   dateController.clear();
  //   descriptionController.clear();
  //   venueController.clear();
  //   chiefGuestController.clear();
  //   participantsController.clear();
  // }

  // Future<String> eventPhotoUpdate({required String uid}) async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();
  //     if (result != null) {
  //       Uint8List? file = result.files.first.bytes;
  //       UploadTask uploadTask = FirebaseStorage.instance
  //           .ref()
  //           .child("files/events/$uid")
  //           .putData(file!);

  //       final TaskSnapshot snap = await uploadTask;
  //       final String downloadUrl = await snap.ref.getDownloadURL();
  //       return downloadUrl;
  //     } else {
  //       return '';
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return '';
  //   }
  // }
}
