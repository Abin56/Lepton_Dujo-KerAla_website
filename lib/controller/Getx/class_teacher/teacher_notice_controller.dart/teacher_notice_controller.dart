import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_kerala_website/controller/admin_login_screen/admin_login_screen_controller.dart';
import 'package:dujo_kerala_website/controller/get_firebase-data/get_firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/class_teacher/class_teacher_notice_model.dart';
import '../../../../view/constant/constant.dart';

class TeacherNoticeController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController headingController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController signedByController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<ClassTeacherNoticeModel> classTeacherNoticeModelData =
      Rxn<ClassTeacherNoticeModel>(null);

  //create events

  Future<void> createNotice({
    required ClassTeacherNoticeModel classTeacherNoticeModel,
  }) async {
    //creating new event

    try {
      isLoading.value = true;
      final CollectionReference<Map<String, dynamic>> noticeCollection =
          firebaseFirestore
              .collection('SchoolListCollection')
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('classes')
              .doc(Get.find<GetFireBaseData>().classIDD.value)
              .collection('ClassNotice');

      //add and update

      await noticeCollection
          .add(
            classTeacherNoticeModel.toMap(),
          )
          .then((value) async =>
              await noticeCollection.doc(value.id).update({"docid": value.id}));

      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Successfully Created');
    } catch (e) {
      showToast(msg: "Failed");
    }
  }

  Future<void> updateNotice(
      {required ClassTeacherNoticeModel classTeacherNoticeModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;

      final DocumentReference<Map<String, dynamic>> noticeCollection =
          firebaseFirestore
              .collection('SchoolListCollection')
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('classes')
              .doc(Get.find<GetFireBaseData>().classIDD.value)
              .collection('ClassNotice')
              .doc(documentId);
      noticeCollection.update(
        classTeacherNoticeModel.toMap(),
      );
      clearControllers();
      isLoading.value = false;
      classTeacherNoticeModelData.value = null;
      showToast(msg: 'Successfully Updated');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(
        msg: "Failed",
      );
    }
  }

  Future<void> deleteNotice(
      {required String documentId, required BuildContext context}) async {
    try {
      final DocumentReference<Map<String, dynamic>> noticeCollection =
          firebaseFirestore
              .collection('SchoolListCollection')
              .doc(Get.find<AdminLoginScreenController>().schoolID)
              .collection(Get.find<GetFireBaseData>().bYear.value)
              .doc(Get.find<GetFireBaseData>().bYear.value)
              .collection('classes')
              .doc(Get.find<GetFireBaseData>().classIDD.value)
              .collection('ClassNotice')
              .doc(documentId);

      noticeCollection.delete();
      classTeacherNoticeModelData.value = null;
      showToast(msg: 'Successfully Removed');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: "Failed");
    }
  }

  void clearControllers() {
    headingController.clear();
    dateController.clear();
    topicController.clear();
    contentController.clear();
    signedByController.clear();
  }
}
