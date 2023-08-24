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

import '../../../model/admin_models/admin_notice_model/admin_notice_model.dart';
import '../../../utils/utils.dart';
import '../../../view/constant/constant.dart';

class AdminNoticeController extends GetxController {
  TextEditingController publishedDateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController dateOfOccasionController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController chiefGuestController = TextEditingController();
  TextEditingController dateOfSubmissionController = TextEditingController();
  TextEditingController signedByController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController customContentController = TextEditingController();
  RxString imageUrl = ''.obs;
  String imageId = '';
  RxString signedImageUrl = ''.obs;
  String signedImageId = '';
  RxBool isLoading = false.obs;
  RxBool isLoadingShowNotice = false.obs;
  RxBool teacherCheckBox = false.obs;
  RxBool studentCheckBox = false.obs;
  RxBool customContentCheckBox = false.obs;
  RxBool guardianCheckBox = false.obs;
  List<String> deviceTokenList = [];
  List<String> parentsTokenList = [];

  List<String> guardiansTokenList = [];
  List<String> studentsTokenList = [];
  Rxn<AdminNoticeModel> adminNoticeModelData = Rxn<AdminNoticeModel>(null);
  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('adminNotice');

  //add admin notice to firebase

  void addAdminNotice() async {
    if (publishedDateController.text.isNotEmpty &&
        headingController.text.isNotEmpty &&
        dateOfOccasionController.text.isNotEmpty &&
        venueController.text.isNotEmpty &&
        chiefGuestController.text.isNotEmpty &&
        signedByController.text.isNotEmpty &&
        subjectController.text.isNotEmpty) {
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
            subject: subjectController.text,
            visibleGuardian: guardianCheckBox.value,
            visibleStudent: studentCheckBox.value,
            visibleTeacher: teacherCheckBox.value,
            customContent: customContentController.text);
        isLoading.value = true;

        final data = await firebaseFirestore.add(
          dataModel.toMap(),
        );
        await firebaseFirestore
            .doc(data.id)
            .update({"noticeId": data.id}).then((value) async {
          await parentsNotification();
          await guardiansNotification();
          await teacherNotification();
          await studentsNotification();
        });
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
            .child(
                "files/${Get.find<AdminLoginScreenController>().schoolID}/${Get.find<GetFireBaseData>().bYear.value}/adminNotice/$uid")
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
            .child(
                "files/${Get.find<AdminLoginScreenController>().schoolID}/${Get.find<GetFireBaseData>().bYear.value}/adminNotice/$uid")
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
      await firebaseFirestore.doc(noticeId).delete();
      showToast(msg: 'Successfully deleted');

//delete notice image from firebase storage
      if (noticeImageId.isNotEmpty) {
        await FirebaseStorage.instance
            .ref()
            .child(
                'files/${Get.find<AdminLoginScreenController>().schoolID}/${Get.find<GetFireBaseData>().bYear.value}/adminNotice/$noticeImageId')
            .delete();
      }
//deleting signed image from firebase storage
      if (signImageId.isNotEmpty) {
        await FirebaseStorage.instance
            .ref()
            .child(
                'files/${Get.find<AdminLoginScreenController>().schoolID}/${Get.find<GetFireBaseData>().bYear.value}/adminNotice/$signImageId')
            .delete();
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

  clearControllers() {
    customContentController.clear();
    publishedDateController.clear();
    headingController.clear();
    dateOfOccasionController.clear();
    venueController.clear();
    chiefGuestController.clear();
    dateOfSubmissionController.clear();
    signedByController.clear();
    subjectController.clear();
    imageUrl.value = '';
    imageId = '';
    signedImageUrl.value = '';
    signedImageId = '';
    teacherCheckBox.value = false;
    studentCheckBox.value = false;
    guardianCheckBox.value = false;
  }

  Future<void> parentsNotification() async {
    CollectionReference collectionRef = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(AdminLoginScreenController().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes');
    QuerySnapshot snapshot = await collectionRef.get();

    for (DocumentSnapshot document in snapshot.docs) {
      DocumentReference docref = document.reference;

      CollectionReference pref = docref.collection('ParentCollection');

      QuerySnapshot snap2 = await pref.get();

      for (DocumentSnapshot doc in snap2.docs) {
        final docData = doc.data() as Map<String, dynamic>;

        if (docData['deviceToken'] != null) {
          parentsTokenList.add(docData['deviceToken']);
        }
      }
    }

    for (var i = 0; i < parentsTokenList.length; i++) {
      sendPushMessage(
          parentsTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }

  Future<void> guardiansNotification() async {
    CollectionReference collectionRef = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(AdminLoginScreenController().schoolID)
        .collection(Get.find<GetFireBaseData>().bYear.value)
        .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('classes');

    QuerySnapshot snapshot = await collectionRef.get();

    for (DocumentSnapshot document in snapshot.docs) {
      DocumentReference docref = document.reference;

      //  final documentData = document.data() as Map<String, dynamic>;

      CollectionReference pref = docref.collection('GuardianCollection');

      QuerySnapshot snap2 = await pref.get();

      for (DocumentSnapshot doc in snap2.docs) {
        final docData = doc.data() as Map<String, dynamic>;
        if (docData['deviceToken'] != null) {
          guardiansTokenList.add(docData['deviceToken']);
        }
      }
    }

    for (var i = 0; i < guardiansTokenList.length; i++) {
      sendPushMessage(
          guardiansTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }

  Future<void> teacherNotification() async {
    final collectionRef = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(AdminLoginScreenController().schoolID)
        .collection('Teachers')
        .get();
    for (DocumentSnapshot doc in collectionRef.docs) {
      final docData = doc.data() as Map<String, dynamic>;
      if (docData['deviceToken'] != null) {
        studentsTokenList.add(docData['deviceToken']);
      }
    }

    // QuerySnapshot snapshot = await collectionRef.get();

    // for (DocumentSnapshot document in snapshot.docs) {
    //   DocumentReference docref = document.reference;

    //   //  final documentData = document.data() as Map<String, dynamic>;

    //   CollectionReference pref = docref.collection('Teachers');

    //   QuerySnapshot snap2 = await pref.get();

    //   for (DocumentSnapshot doc in snap2.docs) {
    //     final docData = doc.data() as Map<String, dynamic>;
    //     if (docData['deviceToken'] != null) {
    //       deviceTokenList.add(docData['deviceToken']);
    //     }
    //   }
    // }

    for (var i = 0; i < deviceTokenList.length; i++) {
      sendPushMessage(
          deviceTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }

  Future<void> studentsNotification() async {
    final collectionRef = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(AdminLoginScreenController().schoolID)
        .collection('AllStudents')
        .get();
    for (DocumentSnapshot doc in collectionRef.docs) {
      final docData = doc.data() as Map<String, dynamic>;
      if (docData['deviceToken'] != null) {
        studentsTokenList.add(docData['deviceToken']);
        log(docData['deviceToken'] + ' ' + docData['studentName']);
      }
    }

    // QuerySnapshot snapshot = await collectionRef.get();

    // for (DocumentSnapshot document in snapshot.docs) {
    //   DocumentReference docref = document.reference;

    //   //  final documentData = document.data() as Map<String, dynamic>;

    //   CollectionReference pref = docref.collection('Students');

    //   QuerySnapshot snap2 = await pref.get();

    //   for (DocumentSnapshot doc in snap2.docs) {
    //     final docData = doc.data() as Map<String, dynamic>;
    //     if (docData['deviceToken'] != null) {
    //       studentsTokenList.add(docData['deviceToken']);
    //     }
    //   }
    // }

    for (var i = 0; i < studentsTokenList.length; i++) {
      sendPushMessage(
          studentsTokenList[i],
          'New Notice added, പുതിയ നോട്ടീസ് പ്രസിദ്ധീകരിച്ചു',
          'Notice Notification');
    }
  }
}
