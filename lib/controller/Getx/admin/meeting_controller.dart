import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../utils/utils.dart';
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
  List<String> deviceTokenList = [];
  List<String> parentsTokenList = [];

  List<String> guardiansTokenList = [];
  List<String> studentsTokenList = [];

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
      await firebaseFirestore
          .doc(data.id)
          .update({"meetingId": data.id}).then((value) async {
        await parentsNotification();
        await guardiansNotification();
        await teacherNotification();
        await studentsNotification();
      });
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

        parentsTokenList.add(docData['deviceToken']);
      }
    }

    for (var i = 0; i < parentsTokenList.length; i++) {
      sendPushMessage(
          parentsTokenList[i], 'New Meeting added, പുതിയ മീറ്റിംഗ് പ്രസിദ്ധീകരിച്ചു', 'Meeting Notification');
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

        guardiansTokenList.add(docData['deviceToken']);
      }
    }

    for (var i = 0; i < guardiansTokenList.length; i++) {
      sendPushMessage(
          guardiansTokenList[i], 'New Meeting added, പുതിയ മീറ്റിംഗ് പ്രസിദ്ധീകരിച്ചു', 'Meeting Notification');
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
    // CollectionReference collectionRef = FirebaseFirestore.instance
    //     .collection('SchoolListCollection')
    //     .doc(AdminLoginScreenController().schoolID)
    //     .collection(Get.find<GetFireBaseData>().bYear.value)
    //     .doc(Get.find<GetFireBaseData>().bYear.value)
    //     .collection('classes');

    // QuerySnapshot snapshot = await collectionRef.get();

    // for (DocumentSnapshot document in snapshot.docs) {
    //   DocumentReference docref = document.reference;

    //   //  final documentData = document.data() as Map<String, dynamic>;

    //   CollectionReference pref = docref.collection('Teachers');

    //   QuerySnapshot snap2 = await pref.get();

    //   for (DocumentSnapshot doc in snap2.docs) {
    //     final docData = doc.data() as Map<String, dynamic>;

    //     deviceTokenList.add(docData['deviceToken']);
    //   }
    // }

    for (var i = 0; i < deviceTokenList.length; i++) {
      sendPushMessage(
          deviceTokenList[i], 'New Meeting added, പുതിയ മീറ്റിംഗ് പ്രസിദ്ധീകരിച്ചു', 'Meeting Notification');
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
      }
    }
    // CollectionReference collectionRef = FirebaseFirestore.instance
    //     .collection('SchoolListCollection')
    //     .doc(AdminLoginScreenController().schoolID)
    //     .collection(Get.find<GetFireBaseData>().bYear.value)
    //     .doc(Get.find<GetFireBaseData>().bYear.value)
    //     .collection('classes');

    // QuerySnapshot snapshot = await collectionRef.get();

    // for (DocumentSnapshot document in snapshot.docs) {
    //   DocumentReference docref = document.reference;

    //   //  final documentData = document.data() as Map<String, dynamic>;

    //   CollectionReference pref = docref.collection('Students');

    //   QuerySnapshot snap2 = await pref.get();

    //   for (DocumentSnapshot doc in snap2.docs) {
    //     final docData = doc.data() as Map<String, dynamic>;

    //     studentsTokenList.add(docData['deviceToken']);
    //   }
    // }

    for (var i = 0; i < studentsTokenList.length; i++) {
      sendPushMessage(
          studentsTokenList[i], 'New Meeting added, പുതിയ മീറ്റിംഗ് പ്രസിദ്ധീകരിച്ചു', 'Meeting Notification');
    }
  }
}
