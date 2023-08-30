import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../../view/constant/constant.dart';

class AdminNoticeController extends GetxController {
  String className = "AdminNoticeController"; //for log
  TextEditingController publishedDateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController dateOfOccasionController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController chiefGuestController = TextEditingController();
  TextEditingController dateOfSubmissionController = TextEditingController();
  TextEditingController signedByController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController customContentController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isLoadingShowNotice = false.obs;
  RxBool teacherCheckBox = RxBool(true);
  RxBool studentCheckBox = RxBool(true);
  RxBool guardianCheckBox = RxBool(true);
  RxBool customContentCheckBox = RxBool(false);
  Uint8List? imageFile;
  Uint8List? signImageFile;

  Rxn<AdminNoticeModel> adminNoticeModelData = Rxn<AdminNoticeModel>(null);
  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('adminNotice');

  //add admin notice to firebase

  Future<void> createNewAdminNotice() async {
    AdminNoticeModel? dataModel;
    String imageUrl = "";
    String signedImageUrl = "";
    try {
      if (imageFile != null && signImageFile != null) {
        isLoading.value = true;
        imageUrl = await photoUpload(imageFile);
        signedImageUrl = await photoUpload(signImageFile);
      }

      if (!customContentCheckBox.value && isFormValid()) {
        isLoading.value = true;
        dataModel = AdminNoticeModel(
          publishedDate: publishedDateController.text,
          heading: headingController.text,
          dateofoccation: dateOfOccasionController.text,
          venue: venueController.text,
          chiefGuest: chiefGuestController.text,
          dateOfSubmission: dateOfSubmissionController.text,
          signedBy: signedByController.text,
          noticeId: '',
          imageUrl: imageUrl,
          signedImageUrl: signedImageUrl,
          subject: subjectController.text,
          visibleGuardian: guardianCheckBox.value,
          visibleStudent: studentCheckBox.value,
          visibleTeacher: teacherCheckBox.value,
          customContent: customContentController.text,
        );
      } else if (customContentController.text.isNotEmpty &&
          customContentCheckBox.value) {
        isLoading.value = true;
        dataModel = AdminNoticeModel(
          chiefGuest: "",
          customContent: customContentController.text,
          dateOfSubmission: "",
          dateofoccation: "",
          heading: "",
          imageUrl: imageUrl,
          noticeId: "",
          publishedDate: "",
          signedBy: "",
          signedImageUrl: signedImageUrl,
          subject: "",
          venue: "",
          visibleGuardian: guardianCheckBox.value,
          visibleStudent: studentCheckBox.value,
          visibleTeacher: teacherCheckBox.value,
        );
      } else {
        showToast(msg: "All fields are mandatory");
      }
      if (dataModel == null) {
        isLoading.value = false;
        return;
      }

      final data = await firebaseFirestore.add(
        dataModel.toMap(),
      );
      await firebaseFirestore
          .doc(data.id)
          .update({"noticeId": data.id}).then((value) async {});
      clearControllers();
      imageUrl = "";
      signedImageUrl = "";

      isLoading.value = false;
      showToast(msg: 'Successfully Created');
    } catch (e) {
      log("$className createNewAdminNotice : $e");
      isLoading.value = false;
    }
  }

  //update notice data on firebase
  Future<void> updateAdminNotice(AdminNoticeModel adminNoticeModel,
      String schoolId, BuildContext context) async {
    try {
      isLoadingShowNotice.value = true;
      await firebaseFirestore
          .doc(adminNoticeModel.noticeId)
          .update(adminNoticeModel.toMap());
      isLoadingShowNotice.value = false;
      adminNoticeModelData.value = null;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      log("$className updateAdminNotice : $e");
      isLoadingShowNotice.value = false;
    }
  }

//files uploaded to firebase
  Future<String> photoUpload(Uint8List? imageFile) async {
    try {
      if (imageFile != null) {
        String uid = const Uuid().v1();
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child(
                "${Get.find<AdminLoginScreenController>().schoolID}/${Get.find<GetFireBaseData>().bYear.value}/adminNotice/$uid")
            .putData(imageFile);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();

        //this variable is used in update page
        isLoadingShowNotice.value = false;
        return downloadUrl;
      } else {
        showToast(msg: "Please Upload Image");
        return "";
      }
    } catch (e) {
      log("$className photoUpload : $e");

      return "";
    }
  }

  Future<String> photoUpdate({required String url}) async {
    try {
      isLoading.value = true;
      isLoadingShowNotice.value = true;
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        //isImageUpload.value = true;
        UploadTask uploadTask =
            FirebaseStorage.instance.refFromURL(url).putData(file!);

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
      log("$className photoUpdate : $e");
      isLoading.value = false;
      isLoadingShowNotice.value = false;
      return '';
    }
  }

  Future<void> removeNotice({
    required String schoolId,
    required String noticeId,
    required String imageUrl,
    required String signUrl,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;
      await firebaseFirestore.doc(noticeId).delete();
      showToast(msg: 'Successfully deleted');

//delete notice image from firebase storage
      if (imageUrl.isNotEmpty) {
        await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      }
//deleting signed image from firebase storage
      if (signUrl.isNotEmpty) {
        await FirebaseStorage.instance.refFromURL(signUrl).delete();
      }
      adminNoticeModelData.value = null;
      isLoading.value = false;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: "Something Went Wrong");
    }
  }

  void clearControllers() {
    customContentController.clear();
    publishedDateController.clear();
    headingController.clear();
    dateOfOccasionController.clear();
    venueController.clear();
    chiefGuestController.clear();
    dateOfSubmissionController.clear();
    signedByController.clear();
    subjectController.clear();
    teacherCheckBox.value = true;
    studentCheckBox.value = true;
    guardianCheckBox.value = true;
    imageFile = null;
    signImageFile = null;
  }

  bool isFormValid() {
    if (publishedDateController.text.isNotEmpty &&
        headingController.text.isNotEmpty &&
        dateOfOccasionController.text.isNotEmpty &&
        venueController.text.isNotEmpty &&
        chiefGuestController.text.isNotEmpty &&
        signedByController.text.isNotEmpty &&
        subjectController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
