import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../view/constant/constant.dart';
import '../../../admin_login_screen/admin_login_screen_controller.dart';
import '../../../get_firebase-data/get_firebase_data.dart';

class TeacherEventController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController signedByController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<ClassTeacherEventModel> classTeacherEventModelData =
      Rxn<ClassTeacherEventModel>(null);

  //create events

  Future<void> createEvents() async {
    log("schoolId:${Get.find<AdminLoginScreenController>().schoolID}");
    log("byear:${Get.find<GetFireBaseData>().bYear.value}");
    log("classId:${Get.find<GetFireBaseData>().classIDD.value}");
    final firebaseFirestore = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(Get.find<AdminLoginScreenController>().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes')
        .doc(Get.find<GetFireBaseData>().classIDD.value)
        .collection('ClassEvents');
    try {
      isLoading.value = true;
      final classTeacherEventModel = ClassTeacherEventModel(
        eventDate: dateController.text,
        eventDescription: descriptionController.text,
        eventName: nameController.text,
        docid: "",
        signedBy: signedByController.text,
        venue: venueController.text,
      );
      await firebaseFirestore
          .add(
        classTeacherEventModel.toMap(),
      )
          .then((value) async {
        //updating document id to firebase
        await firebaseFirestore.doc(value.id).update({
          "docid": value.id,
        });
      });
      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Successfully Creted');
    } catch (e) {
      showToast(msg: "Failed");
    }
  }

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

  void clearControllers() {
    nameController.clear();
    dateController.clear();
    descriptionController.clear();
    venueController.clear();
    signedByController.clear();
  }

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
