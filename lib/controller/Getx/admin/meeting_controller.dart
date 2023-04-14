import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../view/constant/constant.dart';

class AdminMeetingController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController categoryOfMeetingController = TextEditingController();
  TextEditingController membersTobeExpectedController = TextEditingController();
  TextEditingController specialGuestController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  RxBool teacherCheckBox = false.obs;
  RxBool studentCheckBox = false.obs;
  RxBool guardianCheckBox = false.obs;
  RxBool isLoadingUpdate = false.obs;
  Rxn<AdminMeetingModel> adminMeetingModelData = Rxn<AdminMeetingModel>(null);

  Future<void> addAdminMeeting(
      String schoolId, AdminMeetingModel adminMeeting) async {
    try {
      isLoading.value = true;
      final data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .add(
            adminMeeting.toJson(),
          );
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .doc(data.id)
          .update({"meetingId": data.id});
      clearControllers();
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

//update meeting details
  Future<void> updateMeetingData(
      {required String schoolId,
      required AdminMeetingModel adminMeetingModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoadingUpdate.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .doc(documentId)
          .update(
            adminMeetingModel.toJson(),
          );
      clearControllers();
      adminMeetingModelData.value = null;
      isLoadingUpdate.value = false;
      showToast(msg: 'Successfully Updated');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(
        msg: e.toString(),
      );
      isLoadingUpdate.value = false;

      print(e.toString());
    }
  }

  Future<void> removeMeeting(
      {required String schoolId,
      required String meetingId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection("SchoolListCollection")
          .doc(schoolId)
          .collection('AdminMeeting')
          .doc(meetingId)
          .delete();
      showToast(msg: 'Successfully deleted');
      adminMeetingModelData.value = null;
      isLoading.value = false;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  void clearControllers() {
    dateController.clear();
    headingController.clear();
    categoryOfMeetingController.clear();
    membersTobeExpectedController.clear();
    specialGuestController.clear();
    timeController.clear();
    venueController.clear();
    teacherCheckBox.value = false;
    studentCheckBox.value = false;
    guardianCheckBox.value = false;
  }
}
