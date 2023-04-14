import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../view/constant/constant.dart';

class TeacherEventController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController chiefGuestController = TextEditingController();
  final TextEditingController participantsController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isImageUpload = false.obs;
  Rxn<ClassTeacherEventModel> classTeacherEventModelData =
      Rxn<ClassTeacherEventModel>(null);
  //create events

  Future<void> createEvents({
    required String schoolId,
    required String classId,
    required ClassTeacherEventModel classTeacherEventModel,
  }) async {
    //creating new event

    try {
      isLoading.value = true;
      final result = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .add(
            classTeacherEventModel.toJson(),
          );
//updating document id to firebase
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .doc(result.id)
          .update({
        "eventId": result.id,
      });

      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Successfully Creted');
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  Future<void> updateEvent(
      {required String schoolId,
      required String classId,
      required ClassTeacherEventModel classTeacherEventModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .doc(documentId)
          .update(
            classTeacherEventModel.toJson(),
          );
      clearControllers();
      isLoading.value = false;
      classTeacherEventModelData.value = null;
      showToast(msg: 'Successfully Updated');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(
        msg: e.toString(),
      );
    }
  }

  Future<void> deleteEvent(
      {required String schoolId,
      required String classId,
      required String documentId,
      required String imageId,
      required BuildContext context}) async {
    try {
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .doc(documentId)
          .delete();

      FirebaseStorage.instance.ref().child('files/events/$imageId').delete();
      classTeacherEventModelData.value = null;
      showToast(msg: 'Successfully Removed');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  void clearControllers() {
    nameController.clear();
    dateController.clear();
    descriptionController.clear();
    venueController.clear();
    chiefGuestController.clear();
    participantsController.clear();
  }

  Future<Map<String, String>> eventPhotoUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        String uid = const Uuid().v1();
        isImageUpload.value = true;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child("files/events/$uid")
            .putData(file!);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();
        isImageUpload.value = false;
        return {
          "downloadUrl": downloadUrl,
          "imageUid": uid,
        };
      } else {
        return {};
      }
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  Future<String> eventPhotoUpdate({required String uid}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        isImageUpload.value = true;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child("files/events/$uid")
            .putData(file!);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();
        isImageUpload.value = false;
        return downloadUrl;
      } else {
        return '';
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
