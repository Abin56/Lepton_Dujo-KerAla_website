import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/model/admin_models/student_protection_model/student_protection_model.dart';
import 'package:dujo_kerala_website/view/constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class StudentProtectionController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  RxBool isLoading = RxBool(false);
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  RxBool isLoadingImage = RxBool(false);
  RxBool isLoadingDialogue = RxBool(false);
  RxMap<String, dynamic> imageData = RxMap<String, dynamic>({});

  Future<void> addStudentProtectionGroupMember(
      StudentProtectionGroupModel data, BuildContext context) async {
    try {
      isLoadingDialogue.value = true;
      DocumentReference<Map<String, dynamic>> result = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('StudentProtection')
          .add(data.toJson());

      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('StudentProtection')
          .doc(result.id)
          .update({"id": result.id});
      showToast(msg: 'Successfully Created');
      isLoadingDialogue.value = false;
      clearField();
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: 'Creation Failed');
      isLoadingDialogue.value = false;
    }
  }

  Future<void> updateStudentProtectionMemberDetail(String memberId,
      StudentProtectionGroupModel data, BuildContext context) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('StudentProtection')
          .doc(memberId)
          .set(
            data.toJson(),
          );
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      clearField();

      showToast(
        msg: 'Updated Successfully',
      );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      showToast(msg: 'Not updated');
    }
  }

  Future<void> removeMember(String memberId, String imageId) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('StudentProtection')
          .doc(memberId)
          .delete();
      if (imageId.isNotEmpty) {
        await firebaseStorage.ref('files/studentProtection/$imageId').delete();
      }

      showToast(
        msg: 'Suceesfully Deleted',
      );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      showToast(msg: 'Failed');
    }
  }

  Future<void> updateImage(String memberId, String imageId) async {
    final Uint8List? result = await pickImage(ImageSource.gallery);

    if (result != null) {
      isLoadingImage.value = true;

      final filePath = await firebaseStorage
          .ref('files/studentProtection/$imageId')
          .putData(result);

      String fileUrl = await filePath.ref.getDownloadURL();
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection('StudentProtection')
          .doc(memberId)
          .set({
        "imageUrl": fileUrl,
      }, SetOptions(merge: true));
      imageData.value = {
        "imageId": imageId,
        "imageUrl": fileUrl,
      };
      isLoadingImage.value = false;
    }
  }

  Future<void> upLoadImage() async {
    try {
      isLoadingImage.value = true;
      final Uint8List? result = await pickImage(ImageSource.gallery);

      if (result != null) {
        final String id = const Uuid().v1();

        final filePath = await firebaseStorage
            .ref('files/studentProtection/$id')
            .putData(result);

        String imageUrlPath = await filePath.ref.getDownloadURL();
        imageData.value = {
          "imageId": id,
          "imageUrl": imageUrlPath,
        };
        isLoadingImage.value = false;
      }
    } catch (e) {
      isLoadingImage.value = false;
      log(e.toString());
    }
  }

  void clearField() {
    nameController.clear();
    positionController.clear();
    designationController.clear();
    imageData.value = {};
  }
}
