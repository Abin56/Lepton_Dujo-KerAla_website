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

import '../../../get_firebase-data/get_firebase_data.dart';

class PtaController extends GetxController {
  final CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('pta');
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  RxBool isLoading = RxBool(false);
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  RxBool isLoadingImage = RxBool(false);
  RxBool isLoadingDialogue = RxBool(false);
  Rxn<Uint8List> imageDataUin8 = Rxn<Uint8List>();

  Future<void> addStudentToPta(BuildContext context) async {
    if (nameController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        designationController.text.isNotEmpty) {
      try {
        final data = StudentProtectionGroupModel(
          name: nameController.text,
          position: positionController.text,
          designation: designationController.text,
          id: "",
          imageUrl: "",
          imageId: "",
        );
        isLoadingDialogue.value = true;
        DocumentReference<Map<String, dynamic>> result =
            await firebaseFirestore.add(data.toJson());
        await firebaseFirestore.doc(result.id).update({"id": result.id});

        if (imageDataUin8.value != null) {
          final String id = const Uuid().v1();
          final filePath = await firebaseStorage
              .ref('files/pta/$id')
              .putData(imageDataUin8.value!);
          String imageUrlPath = await filePath.ref.getDownloadURL();
          await firebaseFirestore.doc(result.id).update(
            {
              "imageId": id,
              "imageUrl": imageUrlPath,
            },
          );
          imageDataUin8.value = null;
        }
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
    } else {
      showToast(msg: 'All Fields Are Mandatory');
    }
  }

  Future<void> updatePta
  (
    String memberId,
    BuildContext context,
    String imageId,
    String imageUrl,
  ) async {
    if (nameController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        designationController.text.isNotEmpty) {
      try {
        StudentProtectionGroupModel studentData = StudentProtectionGroupModel(
          name: nameController.text,
          position: positionController.text,
          designation: designationController.text,
          id: memberId,
          imageUrl: imageUrl,
          imageId: imageId,
        );
        isLoadingDialogue.value = true;
        await firebaseFirestore.doc(memberId).set(
              studentData.toJson(),
            );
        if (imageDataUin8.value != null) {
          final filePath = await firebaseStorage
              .ref('files/pta/$imageId')
              .putData(imageDataUin8.value!);

          String fileUrl = await filePath.ref.getDownloadURL();
          await firebaseFirestore.doc(memberId).update(
            {
              "imageUrl": fileUrl,
            },
          );
        }
        if (context.mounted) {
          Navigator.of(context).pop();
        }
        clearField();

        showToast(
          msg: 'Updated Successfully',
        );
        isLoadingDialogue.value = false;
      } catch (e) {
        isLoadingDialogue.value = false;
        showToast(msg: e.toString());
      }
    } else {
      showToast(msg: 'All Fields Are Mandatory');
    }
  }

  Future<void> removePtaMember(String memberId, String imageId) async {
    try {
      isLoading.value = true;
      await firebaseFirestore.doc(memberId).delete();
      if (imageId.isNotEmpty) {
        await firebaseStorage.ref('files/pta/$imageId').delete();
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

  Future<void> selectImageFromStorage() async {
    final Uint8List? result = await pickImage(ImageSource.gallery);
    if (result != null) {
      imageDataUin8.value = result;
    }
  }

  void clearField() {
    nameController.clear();
    positionController.clear();
    designationController.clear();
    imageDataUin8.value = null;
  }
}
