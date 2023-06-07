import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../view/constant/constant.dart';
import '../../admin_login_screen/admin_login_screen_controller.dart';
import '../../get_firebase-data/get_firebase_data.dart';

class AdminMeetingController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController categoryOfMeetingController = TextEditingController();
  TextEditingController membersTobeExpectedController = TextEditingController();
  TextEditingController specialGuestController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(Get.find<AdminLoginScreenController>().schoolID)
          .collection(Get.find<GetFireBaseData>().bYear.value)
          .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('AdminMeeting');
  RxBool isLoading = false.obs;
  RxBool teacherCheckBox = false.obs;
  RxBool studentCheckBox = false.obs;
  RxBool guardianCheckBox = false.obs;
  RxBool isLoadingUpdate = false.obs;
  Rxn<AdminMeetingModel> adminMeetingModelData = Rxn<AdminMeetingModel>(null);

  Future<void> addAdminMeeting(
      String schoolId, AdminMeetingModel adminMeeting) async {
    if (dateController.text.isEmpty ||
        headingController.text.isEmpty ||
        categoryOfMeetingController.text.isEmpty ||
        membersTobeExpectedController.text.isEmpty ||
        specialGuestController.text.isEmpty ||
        timeController.text.isEmpty ||
        venueController.text.isEmpty) {
      return showToast(msg: 'All Fields are madatory');
    } else if (!teacherCheckBox.value &&
        !studentCheckBox.value &&
        !guardianCheckBox.value) {
      return showToast(msg: "Please tick atleast one box");
    }

    try {
      isLoading.value = true;
      final data = await firebaseFirestore.add(
        adminMeeting.toJson(),
      );
      await firebaseFirestore.doc(data.id).update({"meetingId": data.id});
      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Meeting Created Successfully');
    } catch (e) {
      showToast(msg: 'Failed');
    }
  }

//update meeting details
  Future<void> updateMeetingData(
      {required String schoolId,
      required AdminMeetingModel adminMeetingModel,
      required String documentId,
      required BuildContext context}) async {
    if (dateController.text.isEmpty ||
        headingController.text.isEmpty ||
        categoryOfMeetingController.text.isEmpty ||
        membersTobeExpectedController.text.isEmpty ||
        specialGuestController.text.isEmpty ||
        timeController.text.isEmpty ||
        venueController.text.isEmpty) {
      return showToast(msg: 'All Fields are madatory');
    } else if (!teacherCheckBox.value &&
        !studentCheckBox.value &&
        !guardianCheckBox.value) {
      return showToast(msg: "Please tick atleast one box");
    }
    try {
      isLoadingUpdate.value = true;
      await firebaseFirestore.doc(documentId).update(
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
        msg: "Failed",
      );
      isLoadingUpdate.value = false;
    }
  }

  Future<void> removeMeeting(
      {required String schoolId,
      required String meetingId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore.doc(meetingId).delete();
      showToast(msg: 'Successfully deleted');
      adminMeetingModelData.value = null;
      isLoading.value = false;
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: "Something Went Wrong");
      isLoading.value = false;
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
