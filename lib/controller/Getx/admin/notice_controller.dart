import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../view/constant/constant.dart';

class AdminNoticeController extends GetxController {
  TextEditingController publishedDateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController dateOfOccasionController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController chiefGuestController = TextEditingController();
  TextEditingController dateOfSubmissionController = TextEditingController();
  TextEditingController signedByController = TextEditingController();
  TextEditingController customContentController = TextEditingController();
  RxString imageUrl = ''.obs;
  String imageId = '';
  RxString signedImageUrl = ''.obs;
  String signedImageId = '';
  RxBool isLoading = false.obs;
  RxBool isLoadingShowNotice = false.obs;
  RxBool teacherCheckBox = false.obs;
  RxBool studentCheckBox = false.obs;
  RxBool guardianCheckBox = false.obs;
  Rxn<AdminNoticeModel> adminNoticeModelData = Rxn<AdminNoticeModel>(null);
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //add admin notice to firebase

  void addAdminNotice() async {
    if (publishedDateController.text.isNotEmpty &&
        headingController.text.isNotEmpty &&
        dateOfOccasionController.text.isNotEmpty &&
        venueController.text.isNotEmpty &&
        chiefGuestController.text.isNotEmpty &&
        signedByController.text.isNotEmpty) {
      try {
        if (!teacherCheckBox.value &&
            !studentCheckBox.value &&
            !guardianCheckBox.value) {
          showToast(msg: "please enter details");
          return;
        }
        AdminNoticeModel dataModel = AdminNoticeModel(
          publishedDate: publishedDateController.text,
          heading: headingController.text,
          dateofoccation: dateOfOccasionController.text,
          venue: venueController.text,
          chiefGuest: chiefGuestController.text,
          dateOfSubmission: dateOfSubmissionController.text,
          signedBy: signedByController.text,
          noticeId: '',
          imageUrl: imageUrl.value,
          signedImageUrl: signedImageUrl.value,
          imageId: imageId,
          signedImageId: signedImageId,
          customContent: customContentController.text,
          visibleGuardian: guardianCheckBox.value,
          visibleStudent: studentCheckBox.value,
          visibleTeacher: teacherCheckBox.value,
        );
        isLoading.value = true;

        final data = await firebaseFirestore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection('adminNotice')
            .add(
              dataModel.toJson(),
            );
        await firebaseFirestore
            .collection('SchoolListCollection')
            .doc(Get.find<AdminLoginScreenController>().schoolID)
            .collection('adminNotice')
            .doc(data.id)
            .update({"noticeId": data.id});
        clearControllers();

        isLoading.value = false;
        showToast(msg: 'Successfully Created');
      } catch (e) {
        log(e.toString());
        isLoading.value = false;
      }
    } else {
      showToast(msg: 'All fields are mandatory');
    }
  }

  //update notice data on firebase
  Future<void> updateAdminNotice(AdminNoticeModel adminNoticeModel,
      String schoolId, BuildContext context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      isLoadingShowNotice.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .doc(adminNoticeModel.noticeId)
          .update(adminNoticeModel.toJson());
      isLoadingShowNotice.value = false;
      adminNoticeModelData.value = null;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      log(e.toString());
      isLoadingShowNotice.value = false;
    }
  }

//files uploaded to firebase
  Future<Map<String, String>> photoUpload() async {
    try {
      isLoading.value = true;

      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        String uid = const Uuid().v1();
        //isImageUpload.value = true;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child("files/adminNotice/$uid")
            .putData(file!);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();

        isLoading.value = false;
        //this variable is used in update page
        isLoadingShowNotice.value = false;
        return {
          "downloadUrl": downloadUrl,
          "imageUid": uid,
        };
      } else {
        return {};
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;

      return {};
    }
  }

  Future<String> photoUpdate({required String uid}) async {
    try {
      isLoading.value = true;
      isLoadingShowNotice.value = true;
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        //isImageUpload.value = true;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child("files/adminNotice/$uid")
            .putData(file!);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();
        isLoading.value = false;
        isLoadingShowNotice.value = false;
        showToast(msg: 'Updated SuccessFully');
        return downloadUrl;
      } else {
        return '';
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      isLoadingShowNotice.value = false;
      return '';
    }
  }

  Future<void> removeNotice(
      {required String schoolId,
      required String noticeId,
      required String noticeImageId,
      required String signImageId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection("SchoolListCollection")
          .doc(schoolId)
          .collection('adminNotice')
          .doc(noticeId)
          .delete();
      showToast(msg: 'Successfully deleted');

//delete notice image from firebase storage
      if (noticeImageId.isNotEmpty) {
        await FirebaseStorage.instance
            .ref()
            .child('files/adminNotice/$noticeImageId')
            .delete();
      }
//deleting signed image from firebase storage
      if (signImageId.isNotEmpty) {
        await FirebaseStorage.instance
            .ref()
            .child('files/adminNotice/$signImageId')
            .delete();
      }
      adminNoticeModelData.value = null;
      isLoading.value = false;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  clearControllers() {
    publishedDateController.clear();
    headingController.clear();
    dateOfOccasionController.clear();
    venueController.clear();
    chiefGuestController.clear();
    dateOfSubmissionController.clear();
    signedByController.clear();
    customContentController.clear();
    imageUrl.value = '';
    imageId = '';
    signedImageUrl.value = '';
    signedImageId = '';
    teacherCheckBox.value = false;
    studentCheckBox.value = false;
    guardianCheckBox.value = false;
  }
}
